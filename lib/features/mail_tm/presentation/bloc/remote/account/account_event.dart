part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}

class CreateAccount extends AccountEvent {
  final JsonParams params;
  CreateAccount(this.params);
}

class CheckAccount extends AccountEvent {}
