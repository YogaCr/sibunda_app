

import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/widget/img_widget.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SibImages {
  SibImages._();
  static Widget get(String fileName, {
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.fill,
    bool showError = false,
  }){
    final dir = getDir(fileName);
    if(package != null) {
      prind("SibImges.get() package != null");
      if(fileName.endsWith(".svg"))
        return SvgPicture.asset(dir, width: width, height: height, fit: fit, package: package,);
      return Image.asset(dir, width: width, height: height, fit: fit, package: package,
        errorBuilder: (ctx, error, stackTrace,) =>
            get(fileName, width: width, height: height, fit: fit,),
        //The image may be in caller's own package, so call this method again with null package.
      );
    } else {
      prind("SibImges.get() package == null");
      if(fileName.endsWith(".svg"))
        return SvgPicture.asset(dir, width: width, height: height, fit: fit,);
      return Image.asset(dir, width: width, height: height, fit: fit,
        errorBuilder: !showError
            ? defImgBuilder()
            : defImgErrorBuilder(),
      );
    }
  }
  static String getDir(String fileName) => !fileName.contains("/") ? "assets/images/$fileName" : fileName;
  static Widget resolve(ImgData data) {
    if(!data.isLocal) {
      return buildImgNetwork(data.link);
    } else {
      return get(data.link, package: data.package);
    }
  }
}