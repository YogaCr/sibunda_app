
import 'package:common/arch/data/remote/model/baby_immunization_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_immunization_api_model.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/range.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'immunization.g.dart';

class ImmunizationData extends Equatable {
  final String name;
  final String? date; //null if the person hasn't taken it.
  final String? location; //null if the person hasn't taken it.
  final String? batchNo; //null if the person hasn't taken it.

  final int immunizationId;
  final int occurrenceId;

  ImmunizationData._({
    required this.name,
    required this.date,
    required this.location,
    required this.batchNo,
    required this.immunizationId,
    required this.occurrenceId,
  });

  factory ImmunizationData({
    required String name,
    required int immunizationId,
    required int occurrenceId,
    String? date,
    String? location,
    String? batchNo,
  }) {
    if((date != null && location == null) || (date == null && location != null)) {
      throw "If `date` and `location` can't be either null or not null. Current data (date=$date), (location=$location)";
    }
    return ImmunizationData._(
      immunizationId: immunizationId,
      occurrenceId: occurrenceId,
      name: name, date: date, location: location, batchNo: batchNo,
    );
  }

  ImmunizationData copy({
    String? name,
    String? date, //null if the person hasn't taken it.
    String? location, //null if the person hasn't taken it.
    String? batchNo, //null if the person hasn't taken it.
    int? immunizationId,
    int? occurrenceId,
  }) => ImmunizationData._(
    name: name ?? this.name,
    date: date ?? this.date,
    location: location ?? this.location,
    batchNo: batchNo ?? this.batchNo,
    immunizationId: immunizationId ?? this.immunizationId,
    occurrenceId: occurrenceId ?? this.occurrenceId,
  );

  @override
  List<Object?> get props => [name, date, location, batchNo, immunizationId, occurrenceId];
}


/// [monthExact] and [monthExact] can't be displayed at the same time.
/// So both [monthExact] and [monthExact] are present, then [monthExact] takes precedence.
/// But, both [monthExact] and [monthExact] cant be null.
class ImmunizationDetail {
  final ImmunizationData immunization;
  final IntRange? monthRange;
  final int? monthExact;
  final int? maxMonthLimit;
  //final String? batchNo;
  final bool noDetail;


  ImmunizationDetail({
    required this.immunization,
    this.maxMonthLimit,
    this.monthRange,
    this.monthExact,
    //this.batchNo,
    this.noDetail = false,
  }) {
    if(!noDetail) {
      if(immunization.date != null && immunization.batchNo == null
          || immunization.date == null && immunization.batchNo != null) {
        throw "If immunization.date != null then immunization.batchNo != null. \n"
            "If immunization.date == null then immunization.batchNo == null. \n"
            "Current immunization.date = '${immunization.date}' \n" //, current batchNo = '$batchNo'
            "For immunization = $immunization";
      }
/*
      if(monthExact == null && monthRange == null) {
        throw "both `monthExact` and `monthExact` can't be null";
      }
 */
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

  static List<ImmunizationDetailGroup> fromBabyResponse(List<BabyImmunizationItemResponse> responses) {
    final map = <int, List<ImmunizationDetail>>{};
    for(final resp in responses) {
      final list = map[resp.month_type] ??= [];
      list.add(ImmunizationDetail(
        immunization: ImmunizationData(
          name: resp.immunization.name, //For now, the name of immunization is static, cuz the server doesn't serve it.
          date: resp.date,
          location: resp.location,
          immunizationId: resp.immunizationId,
          occurrenceId: resp.id,
          batchNo: resp.noBatch,
        ),
      ));
    }
    return map.entries.map((e) => ImmunizationDetailGroup(
      header: getBabyImmunizationHeader(e.key),
      immunizationList: e.value,
    )).toList(growable: false);
  }
  static List<ImmunizationDetailGroup> fromPregnancyResponse(List<PregnancyImmunizationResponse> responses) {
    final map = <int, List<ImmunizationDetail>>{};
    for(final resp in responses) {
      final list = map[resp.trimester] ??= [];
      list.add(ImmunizationDetail(
        immunization: ImmunizationData(
          name: Strings.tetanus, //For now, the name of immunization is static, cuz the server doesn't serve it.
          date: resp.date,
          location: resp.location,
          immunizationId: resp.immunizationId,
          occurrenceId: resp.id,
        ),
        noDetail: true,
      ));
    }
    return map.entries.map((e) => ImmunizationDetailGroup(
      header: "Trimester ${e.key}",
      immunizationList: e.value,
    )).toList(growable: false);
  }
}


class ImmunizationOverview {
  final String text;
  final ImgData img;

  ImmunizationOverview({
    required this.img,
    required this.text,
  });
}


class ImmunizationConfirmData {
  final ImmunizationData immunization;
  final String responsibleName;
  final String date;
  final String place;
  final String noBatch;

  ImmunizationConfirmData({
    required this.immunization,
    required this.responsibleName,
    required this.date,
    required this.place,
    required this.noBatch,
  });
}

@JsonSerializable()
class ImmunizationFill {
  @JsonKey(name: Const.KEY_RESPONSIBLE_NAME)
  final String responsibleName;
  @JsonKey(name: Const.KEY_IMMUNIZATION_DATE)
  final String date;
  @JsonKey(name: Const.KEY_IMMUNIZATION_PLACE)
  final String place;
  @JsonKey(name: Const.KEY_NO_BATCH)
  final String noBatch;

  ImmunizationFill({
    required this.responsibleName,
    required this.date,
    required this.place,
    this.noBatch = "",
  });

  factory ImmunizationFill.fromJson(Map<String, dynamic> map) => _$ImmunizationFillFromJson(map);
  Map<String, dynamic> toJson() => _$ImmunizationFillToJson(this);
}

/*
aaf() {
  final data = ImmunizationConfirmData(
    immunization: immunization,
    responsibleName: respMap[Const.KEY_RESPONSIBLE_NAME],
    date: respMap[Const.KEY_IMMUNIZATION_DATE],
    place: respMap[Const.KEY_IMMUNIZATION_PLACE],
    noBatch: respMap[Const.KEY_NO_BATCH] ?? "",
  );
}
 */