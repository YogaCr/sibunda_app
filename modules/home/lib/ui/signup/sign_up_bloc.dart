import 'package:common/core/ui/bloc/form_bloc.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:tuple/tuple.dart';
import 'package:email_validator/email_validator.dart';

class SignUpFormBloc extends FormBloc {
  SignUpFormBloc() : super([
    Tuple2(Const.KEY_NAME, Strings.name),
    Tuple2(Const.KEY_EMAIL, Strings.email),
    Tuple2(Const.KEY_PSWD, Strings.password),
    Tuple2(Const.KEY_RE_PSWD, Strings.password_re),
  ]);

  @override
  Future<Result<String>> doSubmitJob() {
    return Future.delayed(Duration(seconds: 2), () async {
      print("SignUpBloc.doSubmitJob() return SUCCESS");
      return Success(data: "Berhasil");
    });
  }

  @override
  Future<bool> validateTxt(String inputKey, String txt) async {
    print("SignUpBloc.validateTxt() inputKey= $inputKey txt= $txt");
    print("SignUpBloc.validateTxt() txt == null => ${txt == null}");
    switch(inputKey) {
      case Const.KEY_EMAIL: return EmailValidator.validate(txt);
      case Const.KEY_PSWD: return txt.length >= 8;
      case Const.KEY_RE_PSWD: return txt == txtControllerList[2].text;
    }
    return txt.isNotEmpty;
  }
}