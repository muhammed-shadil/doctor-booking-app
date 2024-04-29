import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_book_app/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(signupEvent);
    on<LoginEvent>(loginEvent);
    on<LogoutEvent>(logoutEvent);
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
      emit(AuthenticatedError(message: e.toString()));
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
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthenticatedError(message: e.toString()));
    }
  }


  FutureOr<void> logoutEvent(LogoutEvent event, Emitter<AuthState> emit) {
     on<LogoutEvent>((event, emit) async {
      try {
        await FirebaseAuth.instance.signOut();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });
  }
}
