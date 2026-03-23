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

  AuthBloc(this.loginUsecase) : super(AuthInitial()) {
    on<AuthLoginUsingEmailandPassword>((event, emit) async {
      // Show loding till the data is fetched
      emit(AuthLoading());

      try {
        final user = await loginUsecase(event.email, event.password);
        emit(AuthSuccess(email: user.email)); // login Successful
      } catch (e) {
        print(e.toString());
        emit(AuthFailure(message: e.toString()));
      }
    });
  }
}
