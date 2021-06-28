
import 'package:common/bloc/form_bloc.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/data/repo/AuthRepo.dart';
import 'package:common/util/functions/txt_ext.dart';
import 'package:common/data/model/auth_data.dart';
import 'package:common/data/Result.dart';
import 'package:common/value/const_values.dart';
import 'package:flutter/material.dart';
import '';

/*
class SignUpFormBloc extends FormBloc {
  static final NAME = "nama";
  static final EMAIL = "email";
  static final PSWD = "password";
  static final RE_PSWD = "password_confirmation";

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

  bool get canProceed => isNameValid && isEmailValid && isPswdValid && isRePswdValid;

  final AuthRepo repo;
  SignUpFormBloc(this.repo);

  @override
  Stream<BlocFormState> specificMapEventToState(FormEvent event) async* {
    if(event is SubmitForm) {
      final inputs = event.formInputs;
      final errorMap = <String, String?>{};

      final name = inputs[NAME];
      final email = inputs[EMAIL];
      final pswd = inputs[PSWD];
      final rePswd = inputs[RE_PSWD];

      if(name.isNullOrBlank) errorMap[NAME] = Strings.field_can_not_be_empty;
      if(email.isNullOrBlank) errorMap[EMAIL] = Strings.field_can_not_be_empty;
      if(pswd.isNullOrBlank) errorMap[PSWD] = Strings.field_can_not_be_empty;
      if(rePswd.isNullOrBlank) errorMap[RE_PSWD] = Strings.field_can_not_be_empty;

      if(existingEmail != null && email == existingEmail) {
        errorMap[EMAIL] = Strings.email_has_already_registered;
        isEmailAvailable = false;
        isEmailValid = false;
      }

      if(canProceed) {
        final signupResult = signup(name!, email!, pswd!, errorMap);
        yield* signupResult;
        if(signupResult is OnValidFormSubmission) {
          login(email, pswd);
        }
      } else {
        yield OnInvalidForm(errorMap);
      }
    }
  }

  void submitForm() {
    add(SubmitForm({
      NAME: nameTextController.text,
      EMAIL: emailTextController.text,
      PSWD: pswdTextController.text,
      RE_PSWD: rePswdTextController.text,
    }));
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
          errorMap[EMAIL] = Strings.email_has_already_registered;
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
    } else if(loginResult  is Fail<SessionData>){
      yield OnErrorSubmission(loginResult);
    }
  }
}
 */