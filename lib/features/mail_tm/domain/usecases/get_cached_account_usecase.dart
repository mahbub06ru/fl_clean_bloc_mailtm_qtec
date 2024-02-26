import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/account_repository.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/login_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';



class GetCachedAccountUseCase implements UseCase<AccountEntity, NoParams> {
  final AccountRepository repository;
  GetCachedAccountUseCase(this.repository);

  @override
  Future<Either<Failure, AccountEntity>> call(NoParams params) async {
    return await repository.getCachedAccount();
  }
}
