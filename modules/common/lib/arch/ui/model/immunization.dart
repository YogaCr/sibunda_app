
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/domain/model/range.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeImmunizationData {
  final ImgData img;
  final String title;
  final String action;

  HomeImmunizationData({
    required this.action,
    required this.title,
    required this.img,
  });
}

/// [monthExact] and [monthExact] can't be displayed at the same time.
/// So both [monthExact] and [monthExact] are present, then [monthExact] takes precedence.
/// But, both [monthExact] and [monthExact] can't be null.
class UiImmunizationListItemDetail {
  final IntRange? monthRange;
  final int? monthExact;
  final String? batchNo;

  UiImmunizationListItemDetail({
    this.monthRange,
    this.monthExact,
    this.batchNo,
  }) {
/*
    if(monthExact == null && monthRange == null) {
      throw "both `monthExact` and `monthExact` can't be null";
    }
 */
  }

  UiImmunizationListItemDetail.fromModelDetail(ImmunizationDetail detailData):
    monthRange = detailData.monthRange,
    monthExact = detailData.monthExact,
    batchNo = detailData.immunization.batchNo
  ;

  UiImmunizationListItemDetail copy({
    IntRange? monthRange,
    int? monthExact,
    String? batchNo,
  }) => UiImmunizationListItemDetail(
    monthRange: monthRange ?? this.monthRange,
    monthExact: monthExact ?? this.monthExact,
    batchNo: batchNo ?? this.batchNo,
  );
}


class UiImmunizationListItem {
  final ImmunizationData core;
  final UiImmunizationListItemDetail? detail;

  UiImmunizationListItem({
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
/*
      if(detail!.monthExact == null && detail!.monthRange == null) {
        throw "both `detail.monthExact` and `detail.monthExact` can't be null";
      }
 */
    }
  }

  UiImmunizationListItem.fromModelDetail(ImmunizationDetail detailData):
    core = detailData.immunization,
    detail = detailData.noDetail ? null : UiImmunizationListItemDetail.fromModelDetail(detailData)
  ;

  UiImmunizationListItem.fromModel(ImmunizationData data): core = data, detail = null;

  UiImmunizationListItem copy({
    ImmunizationData? core,
    UiImmunizationListItemDetail? detail,
  }) => UiImmunizationListItem(
    core: core ?? this.core,
    detail: detail ?? this.detail,
  );
}

class UiImmunizationListGroup {
  final List<UiImmunizationListItem> immunizationList;
  final String header;

  UiImmunizationListGroup({
    required this.immunizationList,
    required this.header,
  });
  UiImmunizationListGroup.fromDomainModel(ImmunizationDetailGroup data):
    immunizationList = data.immunizationList.map((e) => UiImmunizationListItem.fromModelDetail(e)).toList(growable: false),
    header = data.header
  ;
}
/*
class UiImmunizationOverview {
  final String text;
  final String imgLink;

  UiImmunizationOverview({
    required this.imgLink,
    required this.text,
  });

  factory UiImmunizationOverview.fromModel(ImmunizationOverview data) => UiImmunizationOverview(
    imgLink: data.imgLink,
    text: data.text,
  );
}

 */
/*
class UiImmunizationOnConfirm {
  final
}

 */