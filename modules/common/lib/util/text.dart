extension StringExt on String {
  bool get isBlank => isEmpty || trim() == "";
  bool get isNumeric => double.tryParse(this) != null;
}

extension StringNullExt on String? {
  bool get isNullOrBlank => this == null || this!.isEmpty || this!.trim() == "";
}