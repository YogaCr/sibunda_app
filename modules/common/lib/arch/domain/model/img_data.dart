import 'package:equatable/equatable.dart';

enum ImgSrc {
  asset,
  file,
  network,
}

class ImgData extends Equatable {
  final String link;
  /// Just for [src] == [ImgSrc.asset].
  final String? package;
  final ImgSrc src;
  //final bool isLocal;

  const ImgData({
    required this.link,
    this.package,
    required this.src,
  });

  static ImgSrc getSrcFromLink(String link) {
    if(
    link.startsWith("http")
    || link.startsWith("https")
    || link.startsWith("ftp")
    ) return ImgSrc.network;
    return ImgSrc.file;
  }

  @override
  List<Object?> get props => [link, package, src];
}