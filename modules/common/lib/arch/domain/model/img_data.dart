class ImgData {
  final String link;
  final String? package;
  final bool isLocal;

  ImgData({
    required this.link,
    this.package,
    required this.isLocal,
  });
}