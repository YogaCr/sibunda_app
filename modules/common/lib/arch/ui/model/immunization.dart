
import 'package:common/arch/domain/model/immunization.dart';
import 'package:core/domain/model/range.dart';


/// [monthExact] and [monthExact] can't be displayed at the same time.
/// So both [monthExact] and [monthExact] are present, then [monthExact] takes precedence.
/// But, both [monthExact] and [monthExact] can't be null.
class ImmunizationListItemDetail {
  final IntRange? monthRange;
  final int? monthExact;
  final String? batchNo;

  ImmunizationListItemDetail({
    this.monthRange,
    this.monthExact,
    this.batchNo,
  }) {
    if(monthExact == null && monthRange == null) {
      throw "both `monthExact` and `monthExact` can't be null";
    }
  }

  ImmunizationListItemDetail.fromModelDetail(ImmunizationDetail detailData):
    monthRange = detailData.monthRange,
    monthExact = detailData.monthExact,
    batchNo = detailData.batchNo
  ;
}


class ImmunizationListItem {
  final ImmunizationData core;
  final ImmunizationListItemDetail? detail;

  ImmunizationListItem({
    required this.core,
    this.detail,
  }) {
    if(detail != null) {
      if(core.date != null && detail!.batchNo == null
          || core.date == null && detail!.batchNo != null) {
        throw "If core.date != null then detail.batchNo != null. \n"
            "If core.date == null then detail.batchNo == null. \n"
            "Current core.date = '${core.date}', current detail.batchNo = '${detail!.batchNo}'";
      }
      if(detail!.monthExact == null && detail!.monthRange == null) {
        throw "both `detail.monthExact` and `detail.monthExact` can't be null";
      }
    }
  }

  ImmunizationListItem.fromModelDetail(ImmunizationDetail detailData):
    core = detailData.immunization,
    detail = ImmunizationListItemDetail(
      monthRange: detailData.monthRange,
      monthExact: detailData.monthExact,
      batchNo: detailData.batchNo,
    );

  ImmunizationListItem.fromModel(ImmunizationData data): core = data, detail = null;
}