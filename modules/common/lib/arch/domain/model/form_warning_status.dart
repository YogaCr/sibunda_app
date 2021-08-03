import 'package:common/arch/data/remote/model/baby_form_warning_api_model.dart';
import 'package:common/arch/data/remote/model/common_chart_api_model.dart';
import 'package:common/arch/data/remote/model/covid_check_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_warning_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/util/assets.dart';

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

  factory FormWarningStatus.fromBabyResponse(BabyFormWarningDescResponse response, {
    int? i,
  }) => FormWarningStatus(
    desc: response.desc ?? "<ada_warning_tapi_desc_null>",
    action: "Cari faskes terdekat",
    isSafe: response.isNormal,
    img: i != null ? getDefaultAssetImg(
      babyWarningImgList[i % babyWarningImgList.length],
    ) : dummyImg,
  );
  static FormWarningStatus? fromBabyResponseStatic(BabyFormWarningDescResponse response, {
    int? i,
  }) => response.desc != null ? FormWarningStatus.fromBabyResponse(response, i: i) : null;

  factory FormWarningStatus.fromPregnancyResponse(PregnancyFormWarningDescResponse response, {
    int? i,
  }) => FormWarningStatus(
    desc: response.desc ?? "<ada_warning_tapi_desc_null>",
    action: "Cari faskes terdekat",
    isSafe: response.isNormal,
    img: i != null ? getDefaultAssetImg(
      pregnancyWarningImgList[i % pregnancyWarningImgList.length],
    ) : dummyImg,
  );
  static FormWarningStatus? fromPregnancyResponseStatic(PregnancyFormWarningDescResponse response, {
    int? i,
  }) => response.desc != null ? FormWarningStatus.fromPregnancyResponse(response, i: i) : null;

  factory FormWarningStatus.fromCovidCheckResponse(CovidCheckFormDataResponse response,) => FormWarningStatus(
    desc: response.result_desc,
    action: "Cari faskes terdekat",
    isSafe: response.result_is_normal,
    img: response.is_ibu ? imgCovidStatusMother : imgCovidStatusBaby,
  );
  factory FormWarningStatus.fromChartResponse(ChartWarningResponse response, {
    required bool isMother,
  }) => FormWarningStatus(
    desc: response.desc ?? "<ada_warning_tapi_desc_nya_null>",
    action: "Cari faskes terdekat",
    isSafe: response.is_normal,
    img: isMother ? imgChartMotherWarning : imgChartBabyWarning,
  );
}