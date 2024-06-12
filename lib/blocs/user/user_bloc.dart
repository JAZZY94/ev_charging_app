import 'package:ev_charging_app/blocs/user/user_event.dart';
import 'package:ev_charging_app/blocs/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirebaseAuth _firebaseAuth;

  UserBloc(this._firebaseAuth) : super(UserInitial()) {
    on<LoadUserEvent>(_onLoadUser);
    on<SetUser>(_onSetUser);
  }

  Future<void> _onLoadUser(LoadUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        emit(UserLoaded(
            username: user.displayName ?? 'User', email: user.email ?? ''));
      } else {
        emit(UserError('No user is currently signed in.'));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  void _onSetUser(SetUser event, Emitter<UserState> emit) {
    emit(UserLoaded(username: event.username, email: event.email));
  }
}
