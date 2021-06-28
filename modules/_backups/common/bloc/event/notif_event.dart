import 'package:equatable/equatable.dart';

abstract class NotifEvent extends Equatable {}

class GetNotifData extends NotifEvent {
  final String email;
  final String time;
  GetNotifData({
    required this.email,
    required this.time,
  });
  @override
  List<Object?> get props => [email, time];
}

class GetMessageData extends NotifEvent {
  final String email;
  final String time;
  GetMessageData({
    required this.email,
    required this.time,
  });
  @override
  List<Object?> get props => [email, time];
}