import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:travel_india/features/auth/domain/usecases/loginUseCase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // this is an instance of 'LoginUsecase' is created
  // this is because the bloc can only talk to the 'LoginUsecase' class
  final LoginUsecase loginUsecase;
  final SignUpUsercase signUpUsercase;

  AuthBloc(this.loginUsecase, this.signUpUsercase) : super(AuthInitial()) {
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
      }
    });
  }
}
