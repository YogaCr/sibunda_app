import 'package:bayiku/core/domain/usecase/baby_check_usecase.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';

class BabyCheckFormVm extends FormVmGroup {
  BabyCheckFormVm({
    required GetBabyCheckForm getBabyCheckForm,
  }): _getBabyCheckForm = getBabyCheckForm
  ;

  final GetBabyCheckForm _getBabyCheckForm;

  @override
  Future<Result<String>> doSubmitJob() async => Success("ok");

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async {
    final res = await _getBabyCheckForm();
    if(res is Success<List<FormGroupData>>) {
      return res.data.map((e) => FormUiGroupData.fromModel(e)).toList(growable: false);
    } else {
      return List.empty(growable: false);
    }
  }

  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async =>
      response is String ? response.isNotEmpty
        : response is Set<int> ? response.isNotEmpty
          : false;
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