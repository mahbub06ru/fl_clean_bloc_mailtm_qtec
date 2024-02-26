import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/login_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';



class GetCachedLoginUseCase implements UseCase<LoginEntity, NoParams> {
  final LoginRepository repository;
  GetCachedLoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginEntity>> call(NoParams params) async {
    return await repository.getCachedUser();
  }
}
