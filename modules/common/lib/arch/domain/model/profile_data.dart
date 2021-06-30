import 'package:common/arch/domain/model/img_data.dart';

class Profile {
  final String name;
  final String email;
  final ImgData img;

  Profile({
    required this.name,
    required this.email,
    required this.img,
  });
}


class AccountData {
  final String name;
  final String email;
  final String pswd;
  final ImgData img;

  AccountData({
    required this.name,
    required this.email,
    required this.pswd,
    required this.img,
  });
}