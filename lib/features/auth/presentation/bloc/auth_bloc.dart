import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:travel_india/features/auth/data/models/user_model.dart';
import 'package:travel_india/features/auth/domain/usecases/loginUseCase.dart';
import 'package:travel_india/features/home_page/home_page.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // this is an instance of 'LoginUsecase' is created
  // this is because the bloc can only talk to the 'LoginUsecase' class
  final LoginUsecase loginUsecase;
  final SignUpUsercase signUpUsercase;
  final GoogleSignInUseCase googleSignInUseCase;

  AuthBloc(this.loginUsecase, this.signUpUsercase, this.googleSignInUseCase)
    : super(AuthInitial()) {
    on<AuthLoginUsingEmailandPassword>((event, emit) async {
      // Show loding till the data is fetched
      emit(AuthLoading());
      print('Loading in AuthBloc');
      try {
        print('calling loginUsecase in AuthBloc');
        final user = await loginUsecase(event.email, event.password);
        if (user.email.isEmpty) {
          emit(LoginFailure(message: "Invalid credentials"));
          return;
        }

        emit(LoginSuccess(email: user.email)); // login Successful
      } catch (e) {
        print(e.toString());
        emit(LoginFailure(message: e.toString()));
        throw 'e.toString()';
      }
    });

    on<AuthSignUpUsingEmailandPassword>((event, emit) async {
      emit(AuthLoading());

      try {
        print('In AuthSignUp');
        final user = await signUpUsercase(
          event.email,
          event.password,
          event.name,
          event.phoneNumber,
          event.lastLocation,
        );
        if (user.email.isEmpty) {
          emit(SignUpFailure(message: "Invalid credentials"));
          return;
        }

        emit(SignUpSuccess(email: user.email)); // SignUp Successful
      } catch (e) {
        print(e.toString());
        emit(SignUpFailure(message: e.toString()));
        throw 'e.toString()';
      }
    });

    on<GoogleSignIn>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await googleSignInUseCase();

        emit(GoogleSignInSuccess(userModel: user)); // treat as login
      } catch (e) {
        emit(GoogleSignInFailure(message: e.toString()));
        throw 'e.toString()';
      }
    });
  }
}
