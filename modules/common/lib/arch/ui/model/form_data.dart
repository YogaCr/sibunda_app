

import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/value/const_values.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

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
/*
class FormTxtFieldState extends Equatable {
  final String text;
  final bool isValid;

  FormTxtFieldState({
    required this.text,
    required this.isValid,
  });

  @override
  List<Object?> get props => [text, isValid];

  FormTxtFieldState copy({
    String? text,
    bool? isValid,
  }) => FormTxtFieldState(text: text ?? this.text, isValid: isValid ?? this.isValid);
}
 */


abstract class FormUiData {
  final FormType type;
  final String question;

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
  final List<String> answerItems;
  final int? selectedAnswer;

  FormUiRadio({
    required String question,
    required this.answerItems,
    this.selectedAnswer,
  }): super(
    type: FormType.radio,
    question: question,
  );

  factory FormUiRadio.fromModel(FormData data) {
    final options = data.options?.map((e) => e.label).toList(growable: false);
    int? selectedItem;
    if(options == null) {
      print("!!! FormUiRadio doesn't have option. !!!");
    } else {
      for(int i = 0; i < options.length; i++) {
        if(data.options![i].isSelected) {
          selectedItem = i;
          break;
        }
      }
    }
    return FormUiRadio(question: data.question, answerItems: options ?? List.empty(), selectedAnswer: selectedItem);
  }
}

class FormUiCheck extends FormUiData {
  final List<String> answerItems;
  final Set<int> selectedAnswers;

  FormUiCheck({
    required String question,
    required this.answerItems,
    Set<int>? selectedAnswers,
  }): this.selectedAnswers = selectedAnswers ?? {},
  super(
    type: FormType.check,
    question: question,
  );

  factory FormUiCheck.fromModel(FormData data,) {
    final options = data.options?.map((e) => e.label).toList(growable: false);
    final selectedItems = <int>{};
    if(options == null) {
      print("!!! FormUiCheck doesn't have option. !!!");
    } else {
      for(int i = 0; i < options.length; i++) {
        if(data.options![i].isSelected) {
          selectedItems.add(i);
        }
      }
    }
    return FormUiCheck(question: data.question, answerItems: options ?? List.empty(), selectedAnswers: selectedItems);
  }
}