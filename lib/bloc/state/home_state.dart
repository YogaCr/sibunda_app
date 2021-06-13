import 'package:common/data/model/home_data.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class OnHomeInit extends HomeState {
  @override
  List<Object?> get props => [];
}

class OnProfileDataChanged extends HomeState {
  final Profile data;
  OnProfileDataChanged(this.data);
  @override
  List<Object?> get props => [data];
}