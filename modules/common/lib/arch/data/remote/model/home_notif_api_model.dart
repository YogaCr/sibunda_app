import 'package:json_annotation/json_annotation.dart';

part 'home_notif_api_model.g.dart';

@JsonSerializable()
class HomeNotifMsgResponse {
  final int code;
  final String message;
  final String status;
  final List<HomeNotifMsgDataResponse> data;

  HomeNotifMsgResponse({
    required this.code,
    required this.message,
    required this.status,
    required this.data,
  });

  factory HomeNotifMsgResponse.fromJson(Map<String, dynamic> map) => _$HomeNotifMsgResponseFromJson(map);
  Map<String, dynamic> fromJson() => _$HomeNotifMsgResponseToJson(this);
}

@JsonSerializable()
class HomeNotifMsgDataResponse {
  final int id;
  final int user_id;
  final bool is_message;
  final String title;
  final String desc;
  final String? img_url;
  final String url;
  final String created_at;
  final String updated_at;

  HomeNotifMsgDataResponse({
    required this.id,
    required this.user_id,
    required this.is_message,
    required this.title,
    required this.desc,
    required this.img_url,
    required this.url,
    required this.created_at,
    required this.updated_at,
  });

  factory HomeNotifMsgDataResponse.fromJson(Map<String, dynamic> map) => _$HomeNotifMsgDataResponseFromJson(map);
  Map<String, dynamic> fromJson() => _$HomeNotifMsgDataResponseToJson(this);
}