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

class OnHomeStatusDataChanged extends HomeState {
  final List<HomeStatus> data;
  OnHomeStatusDataChanged(this.data);
  @override
  List<Object?> get props => [data];
}

class OnHomeMenuDataChanged extends HomeState {
  final List<HomeMenu> data;
  OnHomeMenuDataChanged(this.data);
  @override
  List<Object?> get props => [data];
}

class OnHomeTipsDataChanged extends HomeState {
  final List<HomeTips> data;
  OnHomeTipsDataChanged(this.data);
  @override
  List<Object?> get props => [data];
}

/*
class OnHomeDataError extends HomeState {
  final List<HomeTips> data;
  OnHomeDataError(this.data);
  @override
  List<Object?> get props => [data];
}
 */