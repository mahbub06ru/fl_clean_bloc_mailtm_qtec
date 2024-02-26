import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/account_use_case.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/get_cached_account_usecase.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/usecase.dart';

import '../../../../domain/usecases/get_cached_login_usecase.dart';
import '../../../../domain/usecases/login_use_case.dart';


part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetCachedAccountUseCase _getCachedUseCase;
  final AccountUseCase _accountUseCase;
  AccountBloc(
    this._accountUseCase,
    this._getCachedUseCase,
  ) : super(AccountInitial()) {
    on<CreateAccount>(_onCreate);
    on<CheckAccount>(_onCheckAccount);
  }

  void _onCreate(CreateAccount event, Emitter<AccountState> emit) async {
    try {
      emit(AccountLoading());
      final result = await _accountUseCase(event.params);
      result.fold(
        (failure) => emit(AccountLoadedFail(failure)),
        (user) => emit(AccountLoaded(user)),
      );
    } catch (e) {
      emit(AccountLoadedFail(ExceptionFailure()));
    }
  }

  void _onCheckAccount(CheckAccount event, Emitter<AccountState> emit) async {
    try {
      emit(AccountLoading());
      final result = await _getCachedUseCase(NoParams());
      result.fold(
        (failure) => emit(AccountLoadedFail(failure)),
        (user) => emit(AccountLoaded(user)),
      );
    } catch (e) {
      emit(AccountLoadedFail(ExceptionFailure()));
    }
  }


}

