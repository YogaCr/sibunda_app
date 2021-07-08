import 'package:common/arch/data/remote/model/baby_form_warning_api_model.dart';
import 'package:common/arch/data/remote/model/covid_check_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/img_data.dart';

class FormWarningStatus {
  final String desc;
  final String action;
  final bool isSafe;
  final ImgData img;

  FormWarningStatus({
    required this.desc,
    required this.action,
    required this.isSafe,
    required this.img,
  });

  factory FormWarningStatus.fromBabyResponse(BabyFormWarningDescResponse response) => FormWarningStatus(
    desc: response.desc,
    action: "Cari faskes terdekat",
    isSafe: response.isNormal,
    img: dummyImg,
  );
  factory FormWarningStatus.fromCovidCheckResponse(CovidCheckFormDataResponse response) => FormWarningStatus(
    desc: response.result_desc,
    action: "Cari faskes terdekat",
    isSafe: response.result_is_normal,
    img: dummyImg,
  );
}