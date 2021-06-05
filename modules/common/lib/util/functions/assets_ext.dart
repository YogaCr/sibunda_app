

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SibImages {
  SibImages._();
  static Widget get(String fileName, {double? width, double? height, BoxFit fit = BoxFit.fill}){
    final dir = getDir(fileName);
    if(fileName.endsWith(".svg"))
      return SvgPicture.asset(dir, width: width, height: height, fit: fit,);
    return Image.asset(dir, width: width, height: height, fit: fit,);
  }
  static String getDir(String fileName) => !fileName.contains("/") ? "assets/images/$fileName" : fileName;
}