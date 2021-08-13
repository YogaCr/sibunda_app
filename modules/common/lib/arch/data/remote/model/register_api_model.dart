import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:common/util/map_util.dart';
import 'package:common/value/const_values.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_api_model.g.dart';


// ============ Body =============
class RegisterBody {
  final SignUpData signup;
  final Mother? mother;
  final Father? father;
  final List<Child> children;
  final DateTime? motherHpl;

  RegisterBody({
    required this.motherHpl,
    required this.signup,
    required this.mother,
    required this.father,
    required this.children,
  });

  /// This method is a signature that be used by retrofit library to convert it to JSON body.
  Map<String, dynamic> toJson() {
    var signupMap = signup.toJson;
    var motherMap = mother?.toJson;
    var fatherMap = father?.toJson;
    var childMaps = children.map((e) => e.toJson).toList(growable: false);
/*
    motherMap[Const.KEY_SALARY] = motherMap[Const.KEY_SALARY].toString();
    fatherMap[Const.KEY_SALARY] = fatherMap[Const.KEY_SALARY].toString();
    //T ODO: Hilangi dummy
    motherMap[Const.KEY_BIRTH_PLACE] = 1104;
    fatherMap[Const.KEY_BIRTH_PLACE] = 1104;
    childMap[Const.KEY_BIRTH_PLACE] = 1104;
 */

    if(motherMap != null) {
      motherMap = addPrefixToMapKeys(motherMap, "bunda_");
    }
    if(fatherMap != null) {
      fatherMap = addPrefixToMapKeys(fatherMap, "ayah_");
    }

    return <String, dynamic>{
      ...signupMap,
      Const.KEY_RE_PSWD: signup.password,
      if(motherMap != null) ...motherMap,
      if(fatherMap != null) ...fatherMap,
      Const.KEY_CHILD: childMaps,
      "janin_hpl": motherHpl?.toString(),
/*
      Const.KEY_CHILD : [
        childMap,
      ],
 */
    };
  }
}

// ============ Responses =============

@JsonSerializable()
class RegisterResponse extends Equatable {
  final String message;
  final String status;
  final int code;
  final UserResponse user;

  RegisterResponse({
    required this.message,
    required this.status,
    required this.code,
    required this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> map) => _$RegisterResponseFromJson(map);

  @override
  List<Object?> get props => [code, message, status, user];
}

@JsonSerializable()
class UserResponse extends Equatable {
  final int id;
  final String name;
  final String email;
  @JsonKey(name: Const.KEY_USER_GROUP_ID)
  final int groupId;

  UserResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.groupId,
  });

  factory UserResponse.fromJson(Map<String, dynamic> map) => _$UserResponseFromJson(map);

  @override
  List<Object?> get props => [id, name, email, groupId];
}