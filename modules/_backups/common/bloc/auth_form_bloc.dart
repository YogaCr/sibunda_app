
import 'package:common/bloc/form_bloc.dart';
import 'package:common/data/repo/AuthRepo.dart';
import 'package:common/data/model/auth_data.dart';
import 'package:common/data/Result.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/const_values.dart';
import 'package:common/util/functions/txt_ext.dart';
import 'package:common/util/prop.dart';
import 'package:flutter/material.dart';

abstract class AuthFormBloc extends FormBloc {

/*
  static final NAME = "nama";
  static final EMAIL = "email";
  static final PSWD = "password";
  static final RE_PSWD = "password_confirmation";
 */

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final pswdTextController = TextEditingController();
  final rePswdTextController = TextEditingController();

  String? existingEmail;

  final isNameValid = LiveProp(false);
  final isEmailValid = LiveProp(false);
  final isEmailAvailable = LiveProp(true);
  final isPswdValid = LiveProp(false);
  final isRePswdValid = LiveProp(false);
  //final isInit = LiveProp(false);

  bool _canProceed = false;
  bool get canProceed;

  final AuthRepo repo;
  AuthFormBloc(this.repo) {
    isNameValid.onChanged = (v) => checkCanProceed();
    isEmailValid.onChanged = (v) => checkCanProceed();
    isEmailAvailable.onChanged = (v) => checkCanProceed();
    isPswdValid.onChanged = (v) => checkCanProceed();
    isRePswdValid.onChanged = (v) => checkCanProceed();

    emailTextController.addListener(() {
      isEmailAvailable.value = emailTextController.text != existingEmail;
    });
    rePswdTextController.addListener(() {
      isRePswdValid.value = rePswdTextController.text == pswdTextController.text;
    });
    //isInit.onChanged = (v) => checkCanProceed();
  }


  @override
  Stream<BlocFormState> specificMapEventToState(FormEvent event) async* {
    if(event is CheckCanProceed) {
      yield OnCanProceedChanged(_canProceed);
    } else {
      yield* authSpecificMapEventToState(event);
    }
  }
  Stream<BlocFormState> authSpecificMapEventToState(FormEvent event);

  // TODO 24 Mei 2021: Pakai method ini saat tiap is..Valid berubah nilai.
  bool checkCanProceed() {
    final newCanProceed = canProceed;
    if(newCanProceed != _canProceed) {
      _canProceed = newCanProceed;
      add(CheckCanProceed());
    }
    return _canProceed;
  }

  Stream<BlocFormState> signup(String name, String email, String pswd, Map<String, String?> errorMap) async* {
    final signUpResult = await repo.signup(SignUpData(
      name: name,
      email: email,
      password: pswd,
    ));

    if(signUpResult is Success<bool>){
      yield OnValidFormSubmission();
    } else if(signUpResult is Fail<bool>) {
      if(signUpResult.code == 500) {
        final data = signUpResult.data?.toString();
        if(data?.contains("duplicate key value violates unique constraint") == true){
          //errorMsg = "Email ${emailTextController.text} sudah ada.";
          errorMap[Const.KEY_EMAIL] = Strings.email_has_already_registered;
          isEmailValid.value = false;
          isEmailAvailable.value = false;
          existingEmail = emailTextController.text;
          yield OnInvalidForm(errorMap);
        } else {
          yield OnInvalidForm(errorMap, "code= ${signUpResult.code} message= ${signUpResult.message}");
        }
      } else {
        yield OnErrorSubmission(signUpResult);
      }
    }
  }

  Stream<BlocFormState> login(String email, String pswd) async* {
    final loginResult = await repo.login(LoginData(
      email: email,
      password: pswd,
    ));
    if(loginResult is Success<SessionData>) {
      final session = loginResult.data;
      yield OnSuccessEndForm({ Const.KEY_ACCESS_TOKEN : session });
    } else if(loginResult is Fail<SessionData>){
      yield OnErrorSubmission(loginResult);
    }
  }

  Stream<BlocFormState> logout(String accessToken) async* {
    final result = await repo.logout(accessToken);
    if(result is Success<bool>) {
      yield OnSuccessEndForm();
    } else if(result is Fail<bool>) {
      yield OnErrorSubmission(result);
    }
  }
}




class SignUpFormBloc extends AuthFormBloc {
  SignUpFormBloc(AuthRepo repo) : super(repo);

  @override
  bool get canProceed => isNameValid.value && isEmailValid.value && isPswdValid.value && isRePswdValid.value;

  @override
  Stream<BlocFormState> authSpecificMapEventToState(FormEvent event) async* {
    if(event is SubmitForm) {
      final inputs = event.formInputs;
      final errorMap = <String, String?>{};

      final name = inputs[Const.KEY_NAME];
      final email = inputs[Const.KEY_EMAIL];
      final pswd = inputs[Const.KEY_PSWD];
      final rePswd = inputs[Const.KEY_RE_PSWD];

      if(name.isNullOrBlank) errorMap[Const.KEY_NAME] = Strings.field_can_not_be_empty;
      if(email.isNullOrBlank) errorMap[Const.KEY_EMAIL] = Strings.field_can_not_be_empty;
      if(pswd.isNullOrBlank) errorMap[Const.KEY_PSWD] = Strings.field_can_not_be_empty;
      if(rePswd.isNullOrBlank) errorMap[Const.KEY_RE_PSWD] = Strings.field_can_not_be_empty;

      if(existingEmail != null && email == existingEmail) {
        errorMap[Const.KEY_EMAIL] = Strings.email_has_already_registered;
        isEmailAvailable.value = false;
        isEmailValid.value = false;
      }

      if(canProceed) {
        final signupResult = await signup(name!, email!, pswd!, errorMap).first;
        print("signupResult= $signupResult errorMap= $errorMap");
        print("signupResult= $signupResult errorMap= $errorMap AKHIR =====");
        if(signupResult is OnValidFormSubmission) {
          final loginResult = await login(email, pswd).first;
          print("loginResult= $loginResult");
          yield loginResult;
        } else {
          yield signupResult;
        }
      } else {
        yield OnInvalidForm(errorMap);
      }
    }
  }

  @override
  void submitForm([Map<String, String?>? extras]) {
    add(SubmitForm({
      Const.KEY_NAME: nameTextController.text,
      Const.KEY_EMAIL: emailTextController.text,
      Const.KEY_PSWD: pswdTextController.text,
      Const.KEY_RE_PSWD: rePswdTextController.text,
    }));
  }
}


class LoginFormBloc extends AuthFormBloc {
  LoginFormBloc(AuthRepo repo) : super(repo);

  @override
  bool get canProceed => isEmailValid.value && isPswdValid.value;

  @override
  Stream<BlocFormState> authSpecificMapEventToState(FormEvent event) async* {
    if(event is SubmitForm) {
      final inputs = event.formInputs;
      final errorMap = <String, String?>{};

      final email = inputs[Const.KEY_EMAIL];
      final pswd = inputs[Const.KEY_PSWD];

      if(email.isNullOrBlank) errorMap[Const.KEY_EMAIL] = Strings.field_can_not_be_empty;
      if(pswd.isNullOrBlank) errorMap[Const.KEY_PSWD] = Strings.field_can_not_be_empty;

      if(canProceed) {
        yield* login(email!, pswd!);
      } else {
        yield OnInvalidForm(errorMap);
      }
    }
  }

  @override
  void submitForm([Map<String, String?>? extras]) {
    add(SubmitForm({
      Const.KEY_EMAIL: emailTextController.text,
      Const.KEY_PSWD: pswdTextController.text,
    }));
  }
}


class LogoutFormBloc extends AuthFormBloc {
  LogoutFormBloc(AuthRepo repo) : super(repo);

  @override
  bool get canProceed => true;

  @override
  Stream<BlocFormState> authSpecificMapEventToState(FormEvent event) async* {
    if(event is SubmitForm) {
      final accessToken = event.formInputs[Const.KEY_ACCESS_TOKEN]!;
      yield* logout(accessToken);
    }
  }

  @override
  void submitForm([Map<String, String?>? extras]) {
    final accessToken = extras?[Const.KEY_ACCESS_TOKEN];
    if(accessToken == null) throw "${Const.KEY_ACCESS_TOKEN} should not be null";
    add(SubmitForm({ Const.KEY_ACCESS_TOKEN : accessToken }));
  }
}
