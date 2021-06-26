import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:tuple/tuple.dart';

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
        //selectedAnswer: 1,
      ),
      FormUiCheck(
        question: "question 2",
        answerItems: ["option 1", "option 2", "option 3", ],
        //selectedAnswers: {0, 2},
      ),
      FormUiTxt(
        question: "question 3",
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