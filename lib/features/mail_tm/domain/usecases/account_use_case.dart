import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/account_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/login_repository.dart';

class AccountUseCase implements UseCase<AccountEntity, JsonParams> {
  final AccountRepository repository;
  AccountUseCase(this.repository);

  @override
  Future<Either<Failure, AccountEntity>> call(JsonParams params) async {
    return await repository.create(params);
  }
}
class JsonParams {
  final String address;
  final String password;
  const JsonParams({
    required this.address,
    required this.password,
  });
}