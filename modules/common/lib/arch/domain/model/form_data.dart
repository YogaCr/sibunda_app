enum FormType {
  text,
  radio,
  check,
}

class FormData {
  final String question;
  final String? answer;
  final List<FormOption>? options;
  final List<String>? imgLink;
  final FormType type;

  FormData({
    required this.question,
    required this.type,
    this.imgLink,
    this.answer,
    this.options,
  });
}

class FormOption {
  final String label;
  final bool isSelected;

  FormOption({
    required this.label,
    required this.isSelected,
  });
}

/*
class FormTxtData {
  final String question;
  final String? answer;

  FormTxtData({
    required this.question,
    this.answer,
  });
}

class FormRadioData {
  final String question;
  final List<String> options;
  final int? selected;

  FormRadioData({
    required this.question,
    required this.options,
    this.selected,
  });
}

class FormCheckData {
  final String question;
  final List<String> options;
  final List<int> selected;

  FormCheckData({
    required this.question,
    required this.options,
    required this.selected,
  });
}
 */