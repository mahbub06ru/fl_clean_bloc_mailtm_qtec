import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';

import '../../../../core/errors/failures.dart';
import '../usecases/login_use_case.dart';


abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> signIn(SignInParams params);
  // Future<Either<Failure, LoginEntity>> login(String address, String password);
  Future<Either<Failure, LoginEntity>> getCachedUser();
}
