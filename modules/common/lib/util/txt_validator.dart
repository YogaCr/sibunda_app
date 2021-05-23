
import 'package:email_validator/email_validator.dart' as DartEmailValidator;

abstract class TxtValidator {
  TxtValidator();

  bool Function(String txt, bool prev)? mapper;

  ///Returns [validator]
  TxtValidator and(TxtValidator validator) {
    mapper = (txt, prev) => prev && validator.validate(txt);
    return validator;
  }
  ///Returns [validator]
  TxtValidator or(TxtValidator validator) {
    mapper = (txt, prev) => prev || validator.validate(txt);
    return validator;
  }

  void andMap(bool Function(String txt) mapper) {
    this.mapper = (txt, prev) => prev && mapper(txt);
  }
  void orMap(bool Function(String txt) mapper) {
    this.mapper = (txt, prev) => prev || mapper(txt);
  }

  bool validate(String txt);
}

class TxtValidatorImpl extends TxtValidator {
  final bool Function(String txt) validator;

  TxtValidatorImpl(this.validator);

  @override
  bool validate(String txt) => validator(txt);
}

class EmailValidator extends TxtValidator {
  @override
  bool validate(String txt) {
    var prev = DartEmailValidator.EmailValidator.validate(txt);
    return mapper?.call(txt, prev) ?? prev;
  }
}

class PasswordValidator extends TxtValidator {
  final RegExp regex;
  PasswordValidator([String regexStr = ".{8}"]) : regex = RegExp(regexStr);
  @override
  bool validate(String txt) {
    var prev = regex.hasMatch(txt);
    return mapper?.call(txt, prev) ?? prev;
  }
}