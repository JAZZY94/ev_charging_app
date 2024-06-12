import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserEvent extends UserEvent {}

class SetUser extends UserEvent {
  final String email;
  final String username;

  const SetUser(this.email, this.username);

  @override
  List<Object> get props => [email, username];
}
