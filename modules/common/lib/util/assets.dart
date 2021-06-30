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
    BoxFit? fit,
    bool showError = false,
  }){
    final usedFit = fit ?? BoxFit.fill;
    final dir = getDir(fileName);
    if(package != null) {
      if(fileName.endsWith(".svg"))
        return SvgPicture.asset(dir, width: width, height: height, fit: usedFit, package: package,);
      return Image.asset(dir, width: width, height: height, fit: usedFit, package: package,
        errorBuilder: (ctx, error, stackTrace,) {
          prind("SibImages.get() image with file name '$fileName' doesn't exist in package '$package'. Trying to look in default package...");
          return get(fileName, width: width, height: height, fit: usedFit,);
        }
        //The image may be in caller's own package, so call this method again with null package.
      );
    } else {
      if(fileName.endsWith(".svg"))
        return SvgPicture.asset(dir, width: width, height: height, fit: usedFit,);
      return Image.asset(dir, width: width, height: height, fit: usedFit,
        errorBuilder: !showError
            ? defImgBuilder()
            : defImgErrorBuilder(),
      );
    }
  }
  static String getDir(String fileName) => !fileName.contains("/") ? "assets/images/$fileName" : fileName;
  static Widget resolve(ImgData data, { BoxFit? fit }) {
    final usedFit = fit ?? BoxFit.fill;
    if(!data.isLocal) {
      return buildImgNetwork(data.link, fit: usedFit);
    } else {
      return get(data.link, package: data.package, fit: usedFit);
    }
  }
}