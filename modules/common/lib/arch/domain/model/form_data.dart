import 'package:common/arch/data/remote/model/baby_check_form_api_model.dart';
import 'package:common/arch/data/remote/model/covid_check_api_model.dart';
import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/widget/form_faker.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/collections.dart';
import 'package:core/ui/base/live_data.dart';

enum FormType {
  text,
  radio,
  check,
  imgPick,
}

enum FieldInputMethod {
  direct,

  /// Only for [FormType.text]
  pickDate,

  /// Only for [FormType.text]
  pickTime,

  /// User can input by pick provided selection.
  /// Only for [FormType.text]
  pick,
}

/// This is just help for [FormFaker].
enum InputType {
  // ==== For FieldInputMethod.text =====
  text,
  number,
  int,
  email,
  password,
  person,
  char,

  // ==== For any FieldInputMethod =====
  selection,

  /// No constraint of input.
  any,
}


class FormData {
  final String key;
  final String question;
  final String? answer;
  final List<FormOption>? options;
  final List<ImgData>? img;
  final FormType type;
  final FieldInputMethod input;
  final InputType inputType;
  final bool isInputEnabled;

  FormData({
    required this.key,
    required this.question,
    required this.type,
    this.img,
    this.answer,
    this.options,
    this.input = FieldInputMethod.direct,
    this.inputType = InputType.any,
    this.isInputEnabled = true,
  });

  factory FormData.fromBabyDevResponse(BabyCheckDevFormDataResponse response) {
    final imgList = response.img_url != null ? [
      ImgData(
        link: response.img_url!,
        src: ImgSrc.network,
      )
    ] : null;
    return FormData(
      key: response.id.toString(),
      question: response.question,
      type: FormType.radio,
      img: imgList,
      options: radioBinaryOption_yesNo,
    );
  }

  factory FormData.fromCovidResponse(CovidFormDataResponse response) {
    return FormData(
      key: response.id.toString(),
      question: response.question,
      type: FormType.radio,
      options: radioBinaryOption_yesNo,
    );
  }
}

class FormOption {
  final String label;
  final bool isSelected;

  FormOption({
    required this.label,
    required this.isSelected,
  });
}

class FormGroupData {
  final String header;
  final List<FormData> data;

  FormGroupData._({
    required this.header,
    required this.data,
  });

  factory FormGroupData({
    required String header,
    required List<FormData> data,
  }) => FormGroupData._(
    header: header,
    data: distinctList(data, selector: (e) => e.key),  // filter first to assure that `key` is unique.
  );

  factory FormGroupData.fromBabyDevResponse(List<BabyCheckDevFormDataResponse> responses) => FormGroupData(
    header: Strings.baby_dev_form,
    data: responses.map((e) => FormData.fromBabyDevResponse(e)).toList(growable: false),
  );
  factory FormGroupData.fromCovidResponse(List<CovidFormDataResponse> responses) => FormGroupData(
    header: Strings.covid_check_form,
    data: responses.map((e) => FormData.fromCovidResponse(e)).toList(growable: false),
  );
}


class FormGroupResponse {
  /// Its keys are the key of each [FormResponse].
  final Map<String, Map<String, dynamic>> responseGroups;

  FormGroupResponse._({
    //required this.headers,
    required this.responseGroups,
  });
  factory FormGroupResponse(List<FormResponse> responseGroups) {
    final map = <String, Map<String, dynamic>>{};
    for(final group in responseGroups) {
      map[group.header] = group.responses;
    }
    return FormGroupResponse._(responseGroups: map);
  }

  Map<String, dynamic>? operator [](String header) => responseGroups[header];
  Map<String, dynamic> toLinear() {
    final map = <String, dynamic>{};
    for(final groupResp in responseGroups.values) {
      for(final key in groupResp.keys) {
        if(map.containsKey(key)) {
          print("`key` '$key' already exists in map result with value '${map[key]}'. Old value is Overwritten");
        }
        map[key] = groupResp[key];
      }
    }
    return map;
  }
}

class FormResponse {
  final String header;
  /// Its keys are the key of each [FormData].
  final Map<String, dynamic> responses;

  FormResponse({
    required this.header,
    required this.responses,
  });
}
