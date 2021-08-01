import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/util/type_util.dart';
import 'package:common/value/const_values.dart';
import 'package:json_annotation/json_annotation.dart';

part 'baby_check_form_api_model.g.dart';


//============ Body ===========
@JsonSerializable()
class BabyGetMonthlyFormBody {
  @JsonKey(name: Const.KEY_YEAR_ID)
  final int yearId;
  final int month;

  BabyGetMonthlyFormBody({
    required this.yearId,
    required this.month,
  });

  factory BabyGetMonthlyFormBody.fromJson(Map<String, dynamic> map) => _$BabyGetMonthlyFormBodyFromJson(map);
  Map<String, dynamic> toJson() => _$BabyGetMonthlyFormBodyToJson(this);
}

@JsonSerializable()
class BabyMonthlyFormBody {
  final int? id; //null if this acts as 'Body', not null if this acts as 'Response'
  @JsonKey(name: Const.KEY_YEAR_ID)
  final int yearId;
  final int month;
  final String date;
  final String location;
  @JsonKey(name: Const.KEY_CHECKER)
  final String checker;
  final int age; //in year, I guess
  @JsonKey(name: Const.KEY_WEIGHT)
  final num weight;
  @JsonKey(name: Const.KEY_HEIGHT)
  final num height;
  @JsonKey(name: Const.KEY_HEAD_CIRCUM)
  final num headCircum;
  @JsonKey(name: Const.KEY_IMT)
  final num bmi;
  final List<BabyMonthlyDevFormBody>? perkembangan_ans; // For now, this will be null even if this class acts as Response, because that's the format from server.

  BabyMonthlyFormBody({
    required this.id,
    required this.yearId,
    required this.month,
    required this.date,
    required this.location,
    required this.checker,
    required this.age,
    required this.weight,
    required this.height,
    required this.headCircum,
    required this.bmi,
    this.perkembangan_ans,
  });

  factory BabyMonthlyFormBody.fromJson(Map<String, dynamic> map) {
    map[Const.KEY_WEIGHT] = tryParseNum(map[Const.KEY_WEIGHT]);
    map[Const.KEY_HEIGHT] = tryParseNum(map[Const.KEY_HEIGHT]);
    map[Const.KEY_HEAD_CIRCUM] = tryParseNum(map[Const.KEY_HEAD_CIRCUM]);
    map[Const.KEY_IMT] = tryParseNum(map[Const.KEY_IMT]);
    return _$BabyMonthlyFormBodyFromJson(map);
  }
  Map<String, dynamic> toJson() => _$BabyMonthlyFormBodyToJson(this);

  factory BabyMonthlyFormBody.fromModel(BabyGrowthCheck model, {
    required int yearId,
    required int month,
    List<BabyMonthlyDevFormBody>? perkembangan_ans,
  }) {
    final map = model.toJson();
    map[Const.KEY_YEAR_ID] = yearId;
    if(perkembangan_ans != null) {
      map["perkembangan_ans"] = perkembangan_ans.map((e) => e.toJson()).toList(growable: false);
    }
    map["month"] = month;
    return BabyMonthlyFormBody.fromJson(map);
  }

  BabyFormId toFormId() => BabyFormId(
    checkUpId: id,
    yearId: yearId,
    month: month,
  );
}

@JsonSerializable()
class BabyMonthlyDevFormBody {
  final int q_id;
  final int ans;
  BabyMonthlyDevFormBody({
    required this.ans,
    required this.q_id,
  });
  factory BabyMonthlyDevFormBody.fromJson(Map<String, dynamic> map) {
    if(!map.containsKey("q_id")) {
      final qId = map["questionnaire_id"];
      if(qId is! int) {
        throw "Response doesn't have key `q_id` nor `questionnaire_id` for `BabyMonthlyDevFormBody.fromJson`\n"
            "Current map = $map";
      }
      map["q_id"] = qId;
    }
    return _$BabyMonthlyDevFormBodyFromJson(map);
  }
  Map<String, dynamic> toJson() => _$BabyMonthlyDevFormBodyToJson(this);
}


//============ Response ===========


@JsonSerializable()
class BabyCheckDevFormDataResponse {
  final int id;
  final int no;
  final String question;
  final String? img_url;
  final int month_start;
  final int month_until;

  BabyCheckDevFormDataResponse({
    required this.id,
    required this.no,
    required this.question,
    required this.img_url,
    required this.month_start,
    required this.month_until,
  });

  factory BabyCheckDevFormDataResponse.fromJson(Map<String, dynamic> map) => _$BabyCheckDevFormDataResponseFromJson(map);
  Map<String, dynamic> toJson() => _$BabyCheckDevFormDataResponseToJson(this);
}