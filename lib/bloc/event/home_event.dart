import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class GetProfileData extends HomeEvent {
  final String email;
  GetProfileData(this.email);
  @override
  List<Object?> get props => [email];
}