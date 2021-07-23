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

  @override
  List<Object?> get props => [link, package, src];
}