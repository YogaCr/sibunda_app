import 'package:equatable/equatable.dart';

class ImgData extends Equatable {
  final String link;
  final String? package;
  final bool isLocal;

  const ImgData({
    required this.link,
    this.package,
    required this.isLocal,
  });

  @override
  List<Object?> get props => [link, package, isLocal];
}