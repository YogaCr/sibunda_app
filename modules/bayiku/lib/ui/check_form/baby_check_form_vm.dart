import 'package:bayiku/core/domain/usecase/baby_check_usecase.dart';
import 'package:common/arch/data/remote/model/baby_check_form_api_model.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

class BabyCheckFormVm extends FormAuthVmGroup {
  static const getWarningListKey = "getWarningList";
  static const getBabyFormAnswerKey = "getBabyFormAnswer";

  BabyCheckFormVm({
    BuildContext? context,
    required this.credential,
    //required GetBabyNik getBabyNik,
    required GetBabyCheckForm getBabyCheckForm,
    required GetBabyGrowthFormWarningStatus getBabyGrowthFormWarningStatus,
    required GetBabyDevFormWarningStatus getBabyDevFormWarningStatus,
    required SaveBabyCheckForm saveBabyCheckForm,
    required GetBabyCheckFormAnswer getBabyCheckFormAnswer,
    //required SaveBabyCheckUpId saveBabyCheckUpId,
  }):
    //_getBabyNik = getBabyNik,
    _getBabyCheckForm = getBabyCheckForm,
    _getBabyGrowthFormWarningStatus = getBabyGrowthFormWarningStatus,
    _getBabyDevFormWarningStatus = getBabyDevFormWarningStatus,
    _saveBabyCheckForm = saveBabyCheckForm,
    _getBabyCheckFormAnswer = getBabyCheckFormAnswer, super(context: context)
    //_saveBabyCheckUpId = saveBabyCheckUpId
  {
    //canProceed.observe(this, (canProceed) { prind("BabyCheckFormVm canProceed = $canProceed _currentMonth= $_currentMonth"); });
    _currentMonth.observe(this, (month) {
      //prind("BabyCheckFormVm _currentMonth.observe() month = $month isFormReady= $isFormReady");
      setResponse(0, Const.KEY_AGE, month);
    });
    onSubmit.observe(this, (success) {
      if(success is Success<String>) {
        setFormEnabled(isEnabled: false);
      }
    });
    _formAnswer.observe(this, (data) {
      prind("_formAnswer.observe data = $data _currentMonth = $_currentMonth");
      if(data != null) {
        final map = data.toJson();
        final respGroupList = <Map<String, dynamic>>[map];
        final devList = map[Const.KEY_PERKEMBANGAN_ANS] as List<BabyMonthlyDevFormBody>?;
        prind("BabyCheckFormVm _formAnswer.observe() devList= $devList");
        if(devList != null) {
          final devMap = <String, dynamic>{};
          respGroupList.add(devMap);
          for(final ans in devList) {
            devMap[ans.q_id.toString()] = getBinaryAnswerYesNoStr(ans.ans);
          }
          map.remove(Const.KEY_PERKEMBANGAN_ANS);
        }
        patchResponse(respGroupList);
        //prind("_formAnswer.observe patchResponse responseGroupList = $responseGroupList data = $data _currentMonth = $_currentMonth");
      } else {
        resetResponses(skippedKeys: { Const.KEY_AGE, });
      }
      //prind("_formAnswer.observe AKHIR!!!! data = $data _currentMonth = $_currentMonth");
      setFormEnabled(isEnabled: data == null);
    });
  }

  //final GetBabyNik _getBabyNik;
  final GetBabyCheckForm _getBabyCheckForm;
  final GetBabyGrowthFormWarningStatus _getBabyGrowthFormWarningStatus;
  final GetBabyDevFormWarningStatus _getBabyDevFormWarningStatus;
  final SaveBabyCheckForm _saveBabyCheckForm;
  final GetBabyCheckFormAnswer _getBabyCheckFormAnswer;
  //final SaveBabyCheckUpId _saveBabyCheckUpId;

  final ProfileCredential credential;

  final MutableLiveData<List<FormWarningStatus>> _growthWarningList = MutableLiveData();
  final MutableLiveData<List<FormWarningStatus>> _devWarningList = MutableLiveData();
  final MutableLiveData<BabyMonthlyFormBody> _formAnswer = MutableLiveData();
  //final MutableLiveData<int> _checkUpId = MutableLiveData();

  LiveData<List<FormWarningStatus>> get growthWarningList => _growthWarningList;
  LiveData<List<FormWarningStatus>> get devWarningList => _devWarningList;
  LiveData<BabyMonthlyFormBody> get formAnswer => _formAnswer;
  //LiveData<int> get checkUpId => _checkUpId;

  @override
  List<LiveData> get liveDatas => [
    _growthWarningList, _devWarningList, _formAnswer,
  ];

  late int yearId;
  final MutableLiveData<int> _currentMonth = MutableLiveData();
  LiveData<int> get currentMonth => _currentMonth;
  //int _currentMonthForForm = 0;

  @override
  Future<Result<String>> doSubmitJob() async {
    final resps = getResponse();
    final maps = resps.responseGroups.values.toList(growable: false);
    final growthMap = maps.first;

    final List<Map<String, dynamic>> devQs = maps.length <= 1
        ? []
        : maps[1].entries.map((e) => {
          "q_id": parseInt(e.key),
          "ans": getBinaryAnswerYesNoInt(e.value), // == Strings.yes ? 1 : 0,
        }).toList(growable: false);
    growthMap[Const.KEY_PERKEMBANGAN_ANS] = devQs;
    growthMap[Const.KEY_YEAR_ID] = yearId;
    growthMap[Const.KEY_MONTH] = _currentMonth.value!;

    final body = BabyMonthlyFormBody.fromJson(growthMap);
    final res = await _saveBabyCheckForm(body);
    //prind("BabyCheckFormVm res = $res");
    /*
    if(res is Success<bool>) {
      if(res.data) {
        final answer = BabyMonthlyForm.fr
      }
    }
     */
    return res is Success<bool> ? Success("ok") : Fail();
  }

  void initFormDataInMonth({
    required int month,
    bool forceLoad = false,
  }) {
    //prind("BabyCheckFormVm initFormDataInMonth() month = $month forceLoad = $forceLoad _currentMonth = $_currentMonth");
    if(!forceLoad && _currentMonth.value == month) return;
    _currentMonth.value = month;
    _devWarningList.value = null;
    _growthWarningList.value = null;
    init(isOneShot: false);
    isFormReady.observeOnce((isReady) {
      //prind("BabyCheckFormVm initFormDataInMonth() isFormReady.observeOnce isReady= $isReady month = $month forceLoad = $forceLoad _currentMonth = $_currentMonth");
      if(isReady == true) {
        getBabyFormAnswer(forceLoad: true);
        getWarningList(forceLoad: true);
        _currentMonth.notifyObservers();
      }
    }, immediatelyGet: false,);
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async {
    //prind("BabyCheckFormVm getFieldGroupList() AWAL _currentMonth = $_currentMonth");
    final res = await _getBabyCheckForm(_currentMonth.value!);
    //prind("BabyCheckFormVm getFieldGroupList() _currentMonth = $_currentMonth res = $res");
    if(res is Success<List<FormGroupData>>) {
      return res.data.map((e) => FormUiGroupData.fromModel(e)).toList(growable: false);
    } else {
      return List.empty(growable: false);
    }
  }
/*

  id: null,
  yearId: 1,
  month: 3,
  date: "2021-10-10",
  location: "ITS",
  checker: "Pak yo",
  age: 10,
  weight: 14,
  height: 12,
  headCircum: 15,
  bmi: 10,
  perkembangan_ans: [],
 */
/*

  final int? id; //null if this acts as 'Body', not null if this acts as 'Response'
  @JsonKey(name: Const.KEY_YEAR_ID)
  final int yearId;
  final int month;
  final String date;
  final String location;
  @JsonKey(name: Const.KEY_CHECKER)
  final String checker;
  final int age; //in year, I guess
  @JsonKey(name: Const.KEY_WEIGHT)
  final num weight;
  @JsonKey(name: Const.KEY_HEIGHT)
  final num height;
  @JsonKey(name: Const.KEY_HEAD_CIRCUM)
  final num headCircum;
  @JsonKey(name: Const.KEY_IMT)
  final num bmi;
  final List<BabyMonthlyDevFormBody>? perkembangan_ans;
 */

  @override
  Set<String>? get mappedKey => {
    Const.KEY_DATE,
    Const.KEY_MONTH,
    Const.KEY_AGE,
    Const.KEY_WEIGHT,
    Const.KEY_HEIGHT,
    Const.KEY_HEAD_CIRCUM,
    Const.KEY_IMT,
  };

  @override
  mapResponse(int groupPosition, String key, response) {
    switch(key){
      case Const.KEY_DATE: return response?.toString();
      case Const.KEY_MONTH:
      case Const.KEY_AGE: return parseInt(response);
      case Const.KEY_WEIGHT:
      case Const.KEY_HEIGHT:
      case Const.KEY_HEAD_CIRCUM:
      case Const.KEY_IMT: return parseNum(response);
    }
    return response;
  }

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    //prind("BabyCheckFormVm.validateField() groupPosition = $groupPosition inputKey = $inputKey response = $response");
    switch(inputKey){
      case Const.KEY_MONTH:
      case Const.KEY_AGE: return tryParseInt(response) != null;
      case Const.KEY_WEIGHT:
      case Const.KEY_HEIGHT:
      case Const.KEY_HEAD_CIRCUM:
      case Const.KEY_IMT: return tryParseNum(response) != null;
    }
    return super.validateField(groupPosition, inputKey, response);
  }

  @override
  String getInvalidMsg(String inputKey, response) {
    switch(inputKey){
      case Const.KEY_MONTH:
      case Const.KEY_AGE: return Strings.field_must_be_int;
      case Const.KEY_WEIGHT:
      case Const.KEY_HEIGHT:
      case Const.KEY_HEAD_CIRCUM:
      case Const.KEY_IMT: return Strings.field_must_be_number;
    }
    return super.getInvalidMsg(inputKey, response);
  }

  void getWarningList({ bool forceLoad = false}) {
    if(!forceLoad && _growthWarningList.value != null) return;
    startJob(getWarningListKey, (isActive) async {
      final babyNik = credential.nik; //res1.data[babyId];
      /*
        if(babyNik == null) {
          throw "No such `babyNik` with `babyId` of '$babyId'";
        }
         */
      final res2 = await _getBabyGrowthFormWarningStatus(yearId: yearId, month: _currentMonth.value!);
      //prind("getWarningList res2 = $res2 _currentMonth = $_currentMonth");
      if(res2 is Success<List<FormWarningStatus>>) {
        final data = res2.data;
        _growthWarningList.value = data;
        //return null;
      } else {
        _growthWarningList.value = List.empty();
      }

      final res3 = await _getBabyDevFormWarningStatus(yearId: yearId, month: _currentMonth.value!);
      //prind("getWarningList res2 = $res2 _currentMonth = $_currentMonth");
      if(res3 is Success<List<FormWarningStatus>>) {
        final data = res3.data;
        _devWarningList.value = data;
        //return null;
      } else {
        _devWarningList.value = List.empty();
      }
      //return res2 as Fail;
    });
  }

  void getBabyFormAnswer({
    //required int yearId,
    bool forceLoad = false
  }) {
    if(!forceLoad && _formAnswer.value != null) return;
    startJob(getBabyFormAnswerKey, (isActive) async {
      final res = await _getBabyCheckFormAnswer(
        yearId : yearId,
        month: _currentMonth.value!,
        babyId: credential.id,
      );
      prind("getBabyFormAnswer res = $res _currentMonth = $_currentMonth");
      if(res is Success<BabyMonthlyFormBody>) {
        final data = res.data;
        _formAnswer.value = data;
        //_checkUpId.value = data.id;
        //return null;
      } else {
        _formAnswer.value = null;
        //_checkUpId.value = null;
      }
      //return res as Fail;
    });
  }
}


/*
class BabyCheckFormVm extends FormGenericVm {
  BabyCheckFormVm() : super(
    keyLabelList: [
      Tuple2("key 1", "label 1"),
      Tuple2("key 2", "label 2"),
      Tuple2("key 3", "label 3"),
    ],
    itemDataList: [
      FormUiRadio(
        question: "question 1",
        answerItems: ["option 1", "option 2", ],
        imgLink: [
        //  "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/1a052c60-b6a8-476f-87d9-04b7f5f0f903/d52ha02-7eebab18-a875-4185-94de-6fd44be0206a.jpg/v1/fill/w_900,h_675,q_75,strp/smiling_cat_by_omniamohamed_d52ha02-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9Njc1IiwicGF0aCI6IlwvZlwvMWEwNTJjNjAtYjZhOC00NzZmLTg3ZDktMDRiN2Y1ZjBmOTAzXC9kNTJoYTAyLTdlZWJhYjE4LWE4NzUtNDE4NS05NGRlLTZmZDQ0YmUwMjA2YS5qcGciLCJ3aWR0aCI6Ijw9OTAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.uEgwgBfq7faRJ9GPWtsJLmc8_kqG11HHAfdtNX5j56A",
          //"https://i.pinimg.com/originals/bf/f5/d0/bff5d074d399bdfec6071e9168398406.jpg",
          //"https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          //"http://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-12/256/smiling-cat-face-with-open-mouth.png",
        ],
        //selectedAnswer: 1,
      ),
      FormUiCheck(
        question: "question 2",
        answerItems: ["option 1", "option 2", "option 3", ],
///*
        imgLink: [
          //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrf_51MS8dpCJfxVBFyQgCQtpbfS2wT6spDgVkFxAkHVf44j3NJ0n8VWV03DdAiteO8D8&usqp=CAU",
          "https://i.redd.it/uxilb61s0fo41.jpg",
        ],
// */
        //selectedAnswers: {0, 2},
      ),
      FormUiTxt(
        question: "question 3",
        //imgLink: ["https://static.boredpanda.com/blog/wp-content/uploads/2015/07/smiling-cat-28__605.jpg",],
      ),
    ],
  );

  @override
  Future<Result<String>> doSubmitJob() async => Success("data");

  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<bool> validateField(String inputKey, response) async => response is String
      ? response.isNotEmpty : (response as Set<int>).isNotEmpty;
}
 */
/*
class BabyCheckFormVm_Late extends LateFormGenericVm {
  BabyCheckFormVm_Late() : super();

  @override
  Future<Result<String>> doSubmitJob() async => Success("data");

  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<bool> validateField(String inputKey, response) async => response is String
      ? response.isNotEmpty : (response as Set<int>).isNotEmpty;

  @override
  Future<List<FormUiData>> getItemDataList() {
    // TODO: implement getItemDataList
    throw UnimplementedError();
  }

  @override
  Future<List<Tuple2<String, String>>> getKeyLabelList() {
    // TODO: implement getKeyLabelList
    throw UnimplementedError();
  }
}
 */