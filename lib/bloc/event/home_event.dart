import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class GetProfileData extends HomeEvent {
  final String email;
  GetProfileData(this.email);
  @override
  List<Object?> get props => [email];
}

class GetHomeStatusData extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class GetHomeMenuData extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class GetHomeTipsData extends HomeEvent {
  @override
  List<Object?> get props => [];
}