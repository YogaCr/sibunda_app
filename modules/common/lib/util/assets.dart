

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SibImages {
  SibImages._();
  static Widget get(String fileName, {String? package, double? width, double? height, BoxFit fit = BoxFit.fill}){
    final dir = getDir(fileName);
    if(fileName.endsWith(".svg"))
      return SvgPicture.asset(dir, width: width, height: height, fit: fit, package: package,);
    return Image.asset(dir, width: width, height: height, fit: fit, package: package,);
  }
  static String getDir(String fileName) => !fileName.contains("/") ? "assets/images/$fileName" : fileName;
}