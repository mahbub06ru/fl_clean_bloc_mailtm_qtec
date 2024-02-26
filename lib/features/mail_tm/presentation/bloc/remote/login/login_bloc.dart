import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/usecase.dart';

import '../../../../domain/usecases/get_cached_login_usecase.dart';
import '../../../../domain/usecases/login_use_case.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<UserEvent, UserState> {
  final GetCachedLoginUseCase _getCachedUserUseCase;
  final LoginUseCase _signInUseCase;
  LoginBloc(
    this._signInUseCase,
    this._getCachedUserUseCase,
  ) : super(UserInitial()) {
    on<SignInUser>(_onSignIn);
    on<GetUser>(_onCheckUser);
  }

  void _onSignIn(SignInUser event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final result = await _signInUseCase(event.params);
      result.fold(
        (failure) => emit(UserLoggedFail(failure)),
        (user) => emit(UserLogged(user)),
      );
    } catch (e) {
      emit(UserLoggedFail(ExceptionFailure()));
    }
  }

  void _onCheckUser(GetUser event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final result = await _getCachedUserUseCase(NoParams());
      result.fold(
        (failure) => emit(UserLoggedFail(failure)),
        (user) => emit(UserLogged(user)),
      );
    } catch (e) {
      emit(UserLoggedFail(ExceptionFailure()));
    }
  }


}

