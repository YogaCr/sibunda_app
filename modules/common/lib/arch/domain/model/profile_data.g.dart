// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BatchProfileIds _$_$_BatchProfileIdsFromJson(Map<String, dynamic> json) {
  return _$_BatchProfileIds(
    motherId: json['motherId'] as int,
    fatherId: json['fatherId'] as int,
    childrenId:
        (json['childrenId'] as List<dynamic>).map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$_$_BatchProfileIdsToJson(_$_BatchProfileIds instance) =>
    <String, dynamic>{
      'motherId': instance.motherId,
      'fatherId': instance.fatherId,
      'childrenId': instance.childrenId,
    };

_$_BatchProfileServer _$_$_BatchProfileServerFromJson(
    Map<String, dynamic> json) {
  return _$_BatchProfileServer(
    mother: json['mother'],
    father: json['father'],
    children: json['children'] as List<dynamic>,
    motherHpl: json['motherHpl'] == null
        ? null
        : DateTime.parse(json['motherHpl'] as String),
  );
}

Map<String, dynamic> _$_$_BatchProfileServerToJson(
        _$_BatchProfileServer instance) =>
    <String, dynamic>{
      'mother': instance.mother,
      'father': instance.father,
      'children': instance.children,
      'motherHpl': instance.motherHpl?.toIso8601String(),
    };
