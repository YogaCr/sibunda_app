import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:home/core/domain/usecase/form_get_started_usecase.dart';
import 'package:tuple/tuple.dart';


class ChildFormVm extends FormVmGroup {
  ChildFormVm(this._useCase) {
    init();
  }
  final SaveChildData _useCase;

  //TODO: <tag>ChildFromVM</tag>
  final MutableLiveData<int> currentPage = MutableLiveData();

  @override
  List<LiveData> get liveDatas => [];

  @override
  Set<String>? get mappedKey => {
    Const.KEY_BIRTH_PLACE,
    Const.KEY_BIRTH_DATE,
    Const.KEY_CHILD_ORDER,
  };
  @override
  mapResponse(int groupPosition, String key, response) {
    switch(key) {
      case Const.KEY_CHILD_ORDER:
        if(response is int) {
          return response;
        }
        throw "Expected type of response with `key` of '$key' is `int`";
      case Const.KEY_BIRTH_PLACE:
        if(response is IdStringModel) {
          return response.id;
        }
        throw "Expected type of response with `key` of '$key' is `IdStringModel`";
      case Const.KEY_BIRTH_DATE:
        if(response is DateTime) {
          return response.toString();
        }
        throw "Expected type of response with `key` of '$key' is `DateTime`";
    }
    return super.mapResponse(groupPosition, key, response);
  }

  @override
  Future<Result<String>> doSubmitJob() async {
    final txtMap = getResponseMap();
    final data = Child.fromJson(txtMap);
    final res = await _useCase(data, currentPage.value!); //.then<Result<String>>((value) => );
    return res is Success<bool>
        ? Success("ok")
        : (res as Fail<bool>).copy();
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async => formDataListToUi(childFormData);

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    switch(inputKey) {
      case Const.KEY_CHILD_ORDER: return tryParseInt(response) != null;
    }
    return super.validateField(groupPosition, inputKey, response);
  }

  @override
  String getInvalidMsg(String inputKey, response) {
    switch(inputKey) {
      case Const.KEY_CHILD_ORDER: return Strings.field_must_be_number;
    }
    return defaultInvalidMsg;
  }
}

/*
class ChildFormVm extends FormTxtVm {
  ChildFormVm(this._useCase) : super(keyLabelList: [
    Tuple2(Const.KEY_NAME, Strings.name),
    Tuple2(Const.KEY_NIK, Strings.nik),
    Tuple2(Const.KEY_JKN, Strings.jkn),
    Tuple2(Const.KEY_BLOOD_TYPE, Strings.blood_type),
    Tuple2(Const.KEY_BIRTH_PLACE, Strings.birth_place),
    Tuple2(Const.KEY_BIRTH_DATE, Strings.birth_date),
    Tuple2(Const.KEY_CHILD_ORDER, Strings.child_order),
    Tuple2(Const.KEY_GENDER, Strings.gender),
    Tuple2(Const.KEY_BIRTH_CERT_NO, Strings.birth_cert_no),
    Tuple2(Const.KEY_JKN_START_DATE, Strings.jkn_start_date),
    Tuple2(Const.KEY_BABY_COHORT_REG, Strings.baby_cohort_no),
    Tuple2(Const.KEY_TODDLER_COHORT_REG, Strings.toddler_cohort_no),
    Tuple2(Const.KEY_HOSPITAL_MEDIC_NO, Strings.hospital_medic_no),
  ]);
  
  final SaveChildData _useCase;
  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<Result<String>> doSubmitJob() async {
    final txtMap = getResponseMap(mappedKey: {Const.KEY_CHILD_ORDER}, mapper: (key, txt) => int.parse(txt));
    final data = Child.fromJson(txtMap);
    return await _useCase(data).then<Result<String>>((value) => value is Success<bool> ? Success("") : value as Fail<String>);
  }

  @override
  Future<bool> validateField(String inputKey, response) async {
    switch(inputKey) {
      case Const.KEY_CHILD_ORDER: return int.tryParse(response) != null;
    }
    return response.isNotEmpty;
  }
}
 */