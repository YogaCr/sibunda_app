
import 'package:common/bloc/form_bloc.dart';
import 'package:common/data/repo/AuthRepo.dart';
import 'package:common/data/model/auth_data.dart';
import 'package:common/data/Result.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/const_values.dart';
import 'package:common/util/functions/txt_ext.dart';
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

  var isNameValid = false;
  var isEmailValid = false;
  var isEmailAvailable = true;
  var isPswdValid = false;
  var isRePswdValid = false;
  var isInit = false;

  bool get canProceed;

  final AuthRepo repo;
  AuthFormBloc(this.repo);

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
          isEmailValid = false;
          isEmailAvailable = false;
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
}




class SignUpFormBloc extends AuthFormBloc {
  SignUpFormBloc(AuthRepo repo) : super(repo);

  @override
  bool get canProceed => isNameValid && isEmailValid && isPswdValid && isRePswdValid;

  @override
  Stream<BlocFormState> specificMapEventToState(FormEvent event) async* {
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
        isEmailAvailable = false;
        isEmailValid = false;
      }

      if(canProceed) {
        final signupResult = signup(name!, email!, pswd!, errorMap);
        yield* signupResult;
        if(signupResult is OnValidFormSubmission) {
          yield* login(email, pswd);
        }
      } else {
        yield OnInvalidForm(errorMap);
      }
    }
  }

  @override
  void submitForm() {
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
  bool get canProceed => isEmailValid && isPswdValid;

  @override
  Stream<BlocFormState> specificMapEventToState(FormEvent event) async* {
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
  void submitForm() {
    add(SubmitForm({
      Const.KEY_EMAIL: emailTextController.text,
      Const.KEY_PSWD: pswdTextController.text,
    }));
  }
}
