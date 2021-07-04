
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/range.dart';
import 'package:json_annotation/json_annotation.dart';


class ImmunizationData {
  final String name;
  final String? date; //null if the person hasn't taken it.
  final String? location; //null if the person hasn't taken it.

  ImmunizationData._({
    required this.name,
    this.date,
    this.location,
  });

  factory ImmunizationData({
    required String name,
    String? date,
    String? location,
  }) {
    if((date != null && location == null) || (date == null && location != null)) {
      throw "If `date` and `location` can't be either null or not null. Current data (date=$date), (location=$location)";
    }
    return ImmunizationData._(name: name, date: date, location: location);
  }

  ImmunizationData copy({
    String? name,
    String? date, //null if the person hasn't taken it.
    String? location, //null if the person hasn't taken it.
  }) => ImmunizationData._(
    name: name ?? this.name,
    date: date ?? this.date,
    location: location ?? this.location,
  );
}


/// [monthExact] and [monthExact] can't be displayed at the same time.
/// So both [monthExact] and [monthExact] are present, then [monthExact] takes precedence.
/// But, both [monthExact] and [monthExact] cant be null.
class ImmunizationDetail {
  final ImmunizationData immunization;
  final IntRange? monthRange;
  final int? monthExact;
  final int? maxMonthLimit;
  final String? batchNo;
  final bool noDetail;

  ImmunizationDetail({
    required this.immunization,
    this.maxMonthLimit,
    this.monthRange,
    this.monthExact,
    this.batchNo,
    this.noDetail = false,
  }) {
    if(!noDetail) {
      if(immunization.date != null && batchNo == null
          || immunization.date == null && batchNo != null) {
        throw "If immunization.date != null then batchNo != null. \n"
            "If immunization.date == null then batchNo == null. \n"
            "Current immunization.date = '${immunization.date}', current batchNo = '$batchNo'";
      }
      if(monthExact == null && monthRange == null) {
        throw "both `monthExact` and `monthExact` can't be null";
      }
    }
  }
}


class ImmunizationDetailGroup {
  final List<ImmunizationDetail> immunizationList;
  final String header;

  ImmunizationDetailGroup({
    required this.immunizationList,
    required this.header,
  });
}


class ImmunizationOverview {
  final String text;
  final String imgLink;

  ImmunizationOverview({
    required this.imgLink,
    required this.text,
  });
}


class ImmunizationConfirmData {
  final ImmunizationData immunization;
  final String responsibleName;
  final String date;
  final String place;
  final int noBatch;

  ImmunizationConfirmData({
    required this.immunization,
    required this.responsibleName,
    required this.date,
    required this.place,
    required this.noBatch,
  });
}