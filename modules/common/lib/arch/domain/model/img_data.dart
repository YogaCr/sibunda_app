class ImgData {
  final String link;
  final String? package;
  final bool isLocal;

  const ImgData({
    required this.link,
    this.package,
    required this.isLocal,
  });
}