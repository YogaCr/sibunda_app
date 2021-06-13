import 'package:equatable/equatable.dart';

abstract class NotifEvent extends Equatable {}

class GetNotifData extends NotifEvent {
  final String email;
  GetNotifData(this.email);
  @override
  List<Object?> get props => [email];
}

class GetMessageData extends NotifEvent {
  final String email;
  GetMessageData(this.email);
  @override
  List<Object?> get props => [email];
}