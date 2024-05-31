import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckLoginStatusEvent>(checklogistatusEvent);
    on<SignUpEvent>(signupEvent);
    on<LoginEvent>(loginEvent);
    on<LogoutEvent>(logoutEvent);
    on<UpdateEvent>(updateEvent);
    on<LogoutConfirmEvent>(logoutconfirmEvent);
  }

  FutureOr<void> signupEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final usercredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.user.email.toString(),
              password: event.user.password.toString());

      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Usermodel usermodel = Usermodel(
          email: user.email,
          uid: user.uid,
          username: event.user.username,
          phone: event.user.phone,
        );

        FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set(usermodel.toMap());

        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      if (e.toString().contains('network-request-failed')) {
        emit(Networkauthenticatederor(message: e.toString()));
      } else if (e.toString().contains('email-already-in-use')) {
        emit(AuthenticatedError(
            message:
                "The email address is already in use by another account."));
      } else {
        emit(AuthenticatedError(message: e.toString()));
      }
    }
  }

  FutureOr<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final usercredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.email, password: event.password);

      final user = usercredential.user;
      if (user != null) {
        emit(Authenticated(user));
        var sharedPref = await SharedPreferences.getInstance();
        sharedPref.setBool("loginkey", true);
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      if (e.toString().contains('network-request-failed')) {
        emit(Networkauthenticatederor(message: e.toString()));
      } else {
        emit(AuthenticatedError(message: e.toString()));
      }
    }
  }

  FutureOr<void> logoutEvent(LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      await FirebaseAuth.instance.signOut();

      emit(UnAuthenticated());
      var sharedPref = await SharedPreferences.getInstance();
      sharedPref.setBool("loginkey", false);
    } catch (e) {
      emit(AuthenticatedError(message: e.toString()));
    }
  }

  FutureOr<void> updateEvent(UpdateEvent event, Emitter<AuthState> emit) {
    final usermodes = Usermodel(
      email: event.user.email,
      uid: event.user.uid,
      age: event.user.age,
      address: event.user.address,
      username: event.user.username,
      phone: event.user.phone,
      image: event.user.image,
    ).toMap();
    try {
      FirebaseFirestore.instance
          .collection("users")
          .doc(event.user.uid)
          .update(usermodes);
      emit(UpdateState());
    } catch (e) {
      emit(UpdationError(msg: e.toString()));
    }
  }

  FutureOr<void> checklogistatusEvent(
      CheckLoginStatusEvent event, Emitter<AuthState> emit) {
    User? user;
    try {
      user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthenticatedError(message: e.toString()));
    }
  }

  FutureOr<void> logoutconfirmEvent(
      LogoutConfirmEvent event, Emitter<AuthState> emit) {
    emit(LogoutConfirm());
  }
}
