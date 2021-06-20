
import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {}

class InitForm extends FormEvent {
  @override
  List<Object> get props => [];
}

class SubmitForm extends FormEvent {
  /// The size must be same as form input size.
  final Map<String, String> formInputs;

  SubmitForm(Map<String, String> formInputs): this.formInputs = Map.unmodifiable(formInputs);

  @override
  List<Object> get props => [formInputs];
}
/*
/// When user successfully submit form and proceed to next page (not form).
class EndFormAndProceed extends FormEvent {
  final Map<String, dynamic> extras;

  EndFormAndProceed([this.extras = const {}]);

  @override
  List<Object?> get props => [extras];
}
 */

class CancelForm extends FormEvent {
  final Map<String, dynamic> extras;

  CancelForm([this.extras = const {}]);

  @override
  List<Object?> get props => [extras];
}

class CheckCanProceed extends FormEvent {
  @override
  List<Object?> get props => [];
}