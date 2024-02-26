part of 'account_bloc.dart';

@immutable
abstract class AccountState extends Equatable {}

class AccountInitial extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountLoading extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountLoaded extends AccountState {
  final AccountEntity user;
  AccountLoaded(this.user);
  @override
  List<Object> get props => [user];
}

class AccountLoadedFail extends AccountState {
  final Failure failure;
  AccountLoadedFail(this.failure);
  @override
  List<Object> get props => [failure];
}

