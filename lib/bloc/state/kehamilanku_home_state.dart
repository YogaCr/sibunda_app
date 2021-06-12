import 'package:common/data/Result.dart';
import 'package:common/data/model/kehamilanku_data.dart';
import 'package:equatable/equatable.dart';
import 'package:sibunda_app/bloc/event/kehamilanku_home_event.dart';

abstract class PregnancyHomeState extends Equatable {}


class OnPregnancyHomeAgeOverviewDataChanged extends PregnancyHomeState {
  final MotherPregnancyAgeOverview data;

  OnPregnancyHomeAgeOverviewDataChanged(this.data);

  @override
  List<Object?> get props => [data];
}

class OnPregnancyHomeInit extends PregnancyHomeState {
  @override
  List<Object?> get props => [];
}

class OnPregnancyHomeTrimesterDataChanged extends PregnancyHomeState {
  final List<MotherTrimester> data;

  OnPregnancyHomeTrimesterDataChanged(this.data);

  @override
  List<Object?> get props => [data];
}

class OnPregnancyHomeFoodRecomDataChanged extends PregnancyHomeState {
  final List<MotherFoodRecom> data;

  OnPregnancyHomeFoodRecomDataChanged(this.data);

  @override
  List<Object?> get props => [data];
}


class OnPregnancyHomeErrorGetData extends PregnancyHomeState {
  final PregnancyHomeEvent event;
  final Fail failure;

  OnPregnancyHomeErrorGetData({
    required this.event,
    required this.failure,
  });

  @override
  List<Object?> get props => [event, failure];
}