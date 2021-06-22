import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/ui/bloc/form_vm.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:home/core/domain/usecase/_auth_usecase.dart';
import 'package:tuple/tuple.dart';
import 'package:email_validator/email_validator.dart';

class SignUpFormVm extends FormVm {
  SignUpFormVm(this.useCase) : super([
    Tuple2(Const.KEY_NAME, Strings.name),
    Tuple2(Const.KEY_EMAIL, Strings.email),
    Tuple2(Const.KEY_PSWD, Strings.password),
    Tuple2(Const.KEY_RE_PSWD, Strings.password_re),
  ]);

  final SignUp useCase;

  @override
  Future<Result<String>> doSubmitJob() async {
    final name = getTxtController(Const.KEY_NAME).text;
    final email = getTxtController(Const.KEY_EMAIL).text;
    final password = getTxtController(Const.KEY_PSWD).text;
    final data = SignUpData(name: name, email: email, password: password);
    return await useCase(data).then<Result<String>>(
            (value) => value is Success<bool> ? Success("") : value as Fail<String>
    );
  }

  @override
  Future<bool> validateTxt(String inputKey, String txt) async {
    //print("SignUpBloc.validateTxt() inputKey= $inputKey txt= $txt");
    //print("SignUpBloc.validateTxt() txt == null => ${txt == null}");
    switch(inputKey) {
      case Const.KEY_EMAIL: return EmailValidator.validate(txt);
      case Const.KEY_PSWD: return txt.length >= 8;
      case Const.KEY_RE_PSWD: return txt.length >= 8 && txt == txtControllerList[2].text;
    }
    return txt.isNotEmpty;
  }
}