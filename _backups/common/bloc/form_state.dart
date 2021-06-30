import 'package:equatable/equatable.dart';
import 'package:common/data/Result.dart';

abstract class BlocFormState extends Equatable {}

/// When user initially enter form page.
class OnInitForm extends BlocFormState {
  @override
  List<Object> get props => [];
}

/// When user just submitted form but not yet receive result.
class OnFormSubmission extends BlocFormState {
  @override
  List<Object> get props => [];
}

/// When user any form input is invalid. It can be either before or after submission.
class OnInvalidForm extends BlocFormState {
  /// The size can be different from form input size.
  /// This maps input field key to error message. If error message null, it means
  /// the input is valid.
  final Map<String, String?> errorMap;
  final dynamic additionalData;

  OnInvalidForm(Map<String, String?> errorMap, [this.additionalData]): this.errorMap = Map.unmodifiable(errorMap);

  @override
  List<Object> get props => [errorMap];
}

/// When user receives submission result, and valid.
class OnValidFormSubmission extends BlocFormState {
  @override
  List<Object> get props => [];
}


/// When user successfully submit form and proceed to next page (not form).
class OnSuccessEndForm extends BlocFormState {
  final Map<String, dynamic> extras;

  OnSuccessEndForm([this.extras = const {}]);

  @override
  List<Object?> get props => [extras];
}

/// When something error happen, especially after user submits the form.
class OnErrorSubmission extends BlocFormState {
  final Fail<dynamic>? failure;

  OnErrorSubmission([this.failure]);

  @override
  List<Object?> get props => [failure];
}

/// When overall validity is changed. If overall validity is `true`,
/// then it means user can proceed to submit the form.
class OnCanProceedChanged extends BlocFormState {
  final bool canProceed;

  OnCanProceedChanged(this.canProceed);

  @override
  List<Object?> get props => [canProceed];
}