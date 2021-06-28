import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:home/core/domain/usecase/_auth_usecase.dart';
import 'package:tuple/tuple.dart';
import 'package:email_validator/email_validator.dart';

class LoginFormVm extends FormTxtVm {
  LoginFormVm(this.useCase) : super(keyLabelList: [
    Tuple2(Const.KEY_EMAIL, Strings.email),
    Tuple2(Const.KEY_PSWD, Strings.password),
  ]);

  final Login useCase;

  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<bool> validateField(String inputKey, response) async {
    switch(inputKey) {
      case Const.KEY_EMAIL: return EmailValidator.validate(response);
      case Const.KEY_PSWD: return response.length >= 8;
    }
    return response.isNotEmpty;
  }

  @override
  Future<Result<String>> doSubmitJob() async {
    final email = getTxtController(Const.KEY_EMAIL).text;
    final password = getTxtController(Const.KEY_PSWD).text;
    final data = LoginData(email: email, password: password);
    return await useCase(data).then<Result<String>>((value) => value is Success<bool> ? Success("") : value as Fail<String>);
  }
}