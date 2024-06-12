import 'dart:async';
import 'package:ev_charging_app/blocs/user/user_bloc.dart';
import 'package:ev_charging_app/blocs/user/user_event.dart'; // Import UserEvent here
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final FirebaseAuth _firebaseAuth;
  final UserBloc _userBloc;

  SplashBloc({required FirebaseAuth firebaseAuth, required UserBloc userBloc})
      : _firebaseAuth = firebaseAuth,
        _userBloc = userBloc,
        super(SplashInitial()) {
    on<StartSplash>(_onStartSplash);
    on<CheckAuthentication>(_onCheckAuthentication);
  }

  Future<void> _onStartSplash(
      StartSplash event, Emitter<SplashState> emit) async {
    await Future.delayed(Duration(seconds: 2));
    emit(SplashCompleted());
    add(CheckAuthentication());
  }

  Future<void> _onCheckAuthentication(
      CheckAuthentication event, Emitter<SplashState> emit) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      _userBloc.add(SetUser(user.email!, user.displayName ?? 'Unknown'));
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }
}
