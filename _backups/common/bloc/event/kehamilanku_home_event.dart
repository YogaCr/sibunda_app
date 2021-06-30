import 'package:equatable/equatable.dart';

abstract class PregnancyHomeEvent extends Equatable {}

class GetPregnancyAgeOverview extends PregnancyHomeEvent {
  @override
  List<Object?> get props => [];
}

class GetTrimester extends PregnancyHomeEvent {
  @override
  List<Object?> get props => [];
}

class GetFoodRecom extends PregnancyHomeEvent {
  final int pregnancyWeekAge;
  GetFoodRecom(this.pregnancyWeekAge);
  @override
  List<Object?> get props => [pregnancyWeekAge];
}

class GetBabySize extends PregnancyHomeEvent {
  final int pregnancyWeekAge;
  GetBabySize(this.pregnancyWeekAge);
  @override
  List<Object?> get props => [pregnancyWeekAge];
}