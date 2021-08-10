import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/util/collections.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:equatable/equatable.dart';

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


abstract class FormUiData extends Equatable {
  final FormType type;
  final FieldInputMethod input;
  final String key;
  final String question;
  final List<ImgData>? img;
  final bool isInputEnabled;

  FormUiData({
    required this.type,
    required this.key,
    required this.question,
    this.img,
    this.input = FieldInputMethod.direct,
    this.isInputEnabled = true,
  });

  @override
  List<Object> get props => [type, key, question, img ?? "<null>", isInputEnabled];
}

class FormUiImgPicker extends FormUiData {
  final ImgData? pickedImg;

  FormUiImgPicker({
    required String key,
    required String question,
    this.pickedImg,
    bool isInputEnabled = true,
    FieldInputMethod input = FieldInputMethod.direct,
    List<ImgData>? img,
  }) : super(
    type: FormType.imgPick,
    key: key,
    question: question,
    img: img,
    input: input,
    isInputEnabled: isInputEnabled,
  );

  factory FormUiImgPicker.fromModel(FormData data,) {
    /*
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
     */
    return FormUiImgPicker(
      key: data.key,
      question: data.question,
      img: data.img,
      input: data.input,
      isInputEnabled: data.isInputEnabled,
    );
  }
}

class FormUiTxt extends FormUiData {
  final String? answer;
  final InputType inputType;

  FormUiTxt({
    required String key,
    required String question,
    this.inputType = InputType.any,
    this.answer,
    bool isInputEnabled = true,
    FieldInputMethod input = FieldInputMethod.direct,
    List<ImgData>? img,
  }): super(
    type: FormType.text,
    key: key,
    question: question,
    img: img,
    input: input,
    isInputEnabled: isInputEnabled,
  );

  factory FormUiTxt.fromModel(FormData data) => FormUiTxt(
    key: data.key, question: data.question, answer: data.answer, img: data.img,
    input: data.input, inputType: data.inputType,
    isInputEnabled: data.isInputEnabled,
  );
}

class FormUiRadio extends FormUiData {
  final List<String> answerItems;
  final int? selectedAnswer;

  FormUiRadio({
    required String key,
    required String question,
    required this.answerItems,
    this.selectedAnswer,
    bool isInputEnabled = true,
    FieldInputMethod input = FieldInputMethod.direct,
    List<ImgData>? img
  }): super(
    type: FormType.radio,
    key: key,
    question: question,
    img: img,
    input: input,
    isInputEnabled: isInputEnabled,
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
    return FormUiRadio(
      key: data.key,
      question: data.question,
      answerItems: options ?? List.empty(),
      selectedAnswer: selectedItem,
      img: data.img,
      input: data.input,
      isInputEnabled: data.isInputEnabled,
    );
  }
}

class FormUiCheck extends FormUiData {
  final List<String> answerItems;
  final Set<int> selectedAnswers;

  FormUiCheck({
    required String key,
    required String question,
    required this.answerItems,
    bool isInputEnabled = true,
    FieldInputMethod input = FieldInputMethod.direct,
    Set<int>? selectedAnswers,
    List<ImgData>? img
  }): this.selectedAnswers = selectedAnswers ?? {},
  super(
    type: FormType.check,
    key: key,
    question: question,
    img: img,
    input: input,
    isInputEnabled: isInputEnabled,
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
    return FormUiCheck(
      key: data.key,
      question: data.question,
      answerItems: options ?? List.empty(),
      selectedAnswers: selectedItems,
      img: data.img,
      input: data.input,
      isInputEnabled: data.isInputEnabled,
    );
  }
}

class FormUiGroupData extends Equatable {
  final String header;
  final List<FormUiData> data;

  FormUiGroupData._({
    required this.header,
    required this.data,
  });

  factory FormUiGroupData({
    required String header,
    required List<FormUiData> data,
  }) => FormUiGroupData._(
    header: header,
    data: distinctList(data, selector: (e) => e.key), // filter first to assure that `key` is unique.
  );

  factory FormUiGroupData.fromModel(FormGroupData data) {
    final fieldData = data.data.map<FormUiData>((e) {
      switch(e.type) {
        case FormType.text: return FormUiTxt.fromModel(e);
        case FormType.check: return FormUiCheck.fromModel(e);
        case FormType.radio: return FormUiRadio.fromModel(e);
        case FormType.imgPick: return FormUiImgPicker.fromModel(e);
      }
    }).toList(growable: false);
    return FormUiGroupData._(
      header: data.header,
      data: fieldData, // No need to filter first, cuz we are sure that `key` from `FormGroupData` is unique.
    );
  }

  @override
  List<Object?> get props => [header, data];
}


class FormVmResponse extends Equatable {
  final LiveData<dynamic> response;
  final LiveData<bool> isValid;

  FormVmResponse({
    required this.response,
    required this.isValid,
  });

  @override
  List<Object?> get props => [response, isValid];
}

class MutableFormVmResponse extends FormVmResponse {
  @override
  final MutableLiveData<dynamic> response;
  @override
  final MutableLiveData<bool> isValid;

  MutableFormVmResponse({
    required this.response,
    required this.isValid,
  }) : super(
    response: response,
    isValid: isValid,
  );

  factory MutableFormVmResponse.def() => MutableFormVmResponse(
    response: MutableLiveData(),
    isValid: MutableLiveData(),
  );
}