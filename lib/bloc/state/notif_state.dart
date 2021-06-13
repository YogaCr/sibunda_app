import 'package:common/data/model/notif_data.dart';
import 'package:equatable/equatable.dart';

abstract class NotifState extends Equatable {}

class OnNotifDataChanged extends NotifState {
  final List<HomeNotifMsg> data;
  OnNotifDataChanged(this.data);
  @override
  List<Object?> get props => [data];
}

class OnMessageDataChanged extends NotifState {
  final List<HomeNotifMsg> data;
  OnMessageDataChanged(this.data);
  @override
  List<Object?> get props => [data];
}