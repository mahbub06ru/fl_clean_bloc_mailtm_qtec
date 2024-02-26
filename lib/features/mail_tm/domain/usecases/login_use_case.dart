import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/login_repository.dart';

class LoginUseCase implements UseCase<LoginEntity, SignInParams> {
  final LoginRepository repository;
  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginEntity>> call(SignInParams params) async {
    return await repository.signIn(params);
  }
}
class SignInParams {
  final String address;
  final String password;
  const SignInParams({
    required this.address,
    required this.password,
  });
}