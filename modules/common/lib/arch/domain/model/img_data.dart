import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

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

  ImgData.fromXFile(XFile file):
    link = file.path,
    package = null,
    src = ImgSrc.file
  ;

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