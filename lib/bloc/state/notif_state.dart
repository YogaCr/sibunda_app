import 'package:common/data/Result.dart';
import 'package:common/data/model/notif_data.dart';
import 'package:equatable/equatable.dart';

abstract class NotifState extends Equatable {}

class OnNotifInit extends NotifState {
  @override
  List<Object?> get props => [];
}

class OnNotifDataChanged extends NotifState {
  final Result<List<HomeNotifMsg>> data;
  OnNotifDataChanged(this.data);
  @override
  List<Object?> get props => [data];
}

class OnMessageDataChanged extends NotifState {
  final Result<List<HomeNotifMsg>> data;
  OnMessageDataChanged(this.data);
  @override
  List<Object?> get props => [data];
}