extension StringExt on String {
  bool get isBlank => isEmpty || trim() == "";
}

extension StringNullExt on String? {
  bool get isNullOrBlank => this == null || this!.isEmpty || this!.trim() == "";
}