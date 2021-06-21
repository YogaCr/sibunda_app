

import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/value/const_values.dart';

enum FormType {
  text,
  radio,
  check,
}
/*
class FormAnswerItem {
  final String text;
  final bool isSelected;

  FormAnswerItem({
    required this.text,
    required this.isSelected,
  });
}
 */


abstract class FormUiData {
  final FormType type;
  final String question;
  String? get answer;

  FormUiData({
    required this.type,
    required this.question,
  });
}

class FormUiTxt extends FormUiData {
  final String? answer;

  FormUiTxt({
    required String question,
    this.answer,
  }): super(
    type: FormType.text,
    question: question,
  );

  factory FormUiTxt.fromModel(FormData data) => FormUiTxt(
    question: data.question, answer: data.answer,
  );
}

class FormUiRadio extends FormUiData {
  final String? answer;
  final List<String> answerItems;
  final int selectedAnswer;

  FormUiRadio({
    required String question,
    required this.answerItems,
    required this.selectedAnswer,
  }): answer = answerItems[selectedAnswer], super(
    type: FormType.radio,
    question: question,
  );

  factory FormUiRadio.fromModel({
    required FormData data,
    required List<String> answerItems,
  }) {
    final selectedItem = answerItems.indexOf(data.answer);
    if(selectedItem < 0) {
      throw "The data.answer (${data.answer}) doesn't match any of item option ($answerItems)";
    }
    return FormUiRadio(question: data.question, answerItems: answerItems, selectedAnswer: selectedItem);
  }
}

class FormUiCheck extends FormUiData {
  late final String? answer;
  final List<String> answerItems;
  final Set<int> selectedAnswers;

  FormUiCheck({
    required String question,
    required this.answerItems,
    required this.selectedAnswers,
  }): super(
    type: FormType.radio,
    question: question,
  ) {
    final selectedItems = selectedAnswers.map((i) => answerItems[i]);
    String tempAnswer = "";
    for(final answer in selectedItems) {
      tempAnswer += "$answer${Const.SEPARATOR_ANSWER_ITEM}";
    }
    answer = tempAnswer.substring(0, tempAnswer.length -Const.SEPARATOR_ANSWER_ITEM.length);
  }

  factory FormUiCheck.fromModel({
    required FormData data,
    required List<String> answerItems,
  }) {
    final answerList = data.answer.split(Const.SEPARATOR_ANSWER_ITEM);
    final selectedAnswers = <int>{};
    int i = 0;
    for(final selectedAnswer in answerList) {
      final selectedItem = answerItems.indexOf(selectedAnswer);
      if(selectedItem < 0) {
        throw "The selectedAnswer ($selectedAnswer) doesn't match any of item option ($answerItems)";
      }
      selectedAnswers.add(i++);
    }
    return FormUiCheck(question: data.question, answerItems: answerItems, selectedAnswers: selectedAnswers);
  }
}