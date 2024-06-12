import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ev_charging_app/blocs/auth/auth_event.dart';
import 'package:ev_charging_app/blocs/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// // Events
// abstract class AuthEvent extends Equatable {
//   const AuthEvent();

//   @override
//   List<Object> get props => [];
// }

// class GoogleSignInRequested extends AuthEvent {}

// // States
// abstract class AuthState extends Equatable {
//   const AuthState();

//   @override
//   List<Object> get props => [];
// }

// class AuthInitial extends AuthState {}

// class AuthInProgress extends AuthState {}

// class AuthSuccess extends AuthState {
//   final User user;

//   const AuthSuccess(this.user);

//   @override
//   List<Object> get props => [user];
// }

// class AuthFailure extends AuthState {
//   final String message;

//   const AuthFailure(this.message);

//   @override
//   List<Object> get props => [message];
// }

// BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthBloc(
      {required FirebaseAuth firebaseAuth, required GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn,
        super(AuthInitial()) {
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
  }

  Future<void> _onGoogleSignInRequested(
      GoogleSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthInProgress());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        emit(const AuthFailure('Google sign in was aborted'));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      emit(AuthSuccess(userCredential.user!));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
