import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/dummy_user.dart';
import '../usecases/sign_in_usecase.dart';


abstract class UserRepository {
  Future<Either<Failure, DomainEntityUser>> signIn(SignInParams params);
  Future<Either<Failure, DomainEntityUser>> getCachedUser();
}
