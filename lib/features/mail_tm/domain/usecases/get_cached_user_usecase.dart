import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/dummy_user.dart';
import '../repositories/user_repository.dart';


class GetCachedUserUseCase implements UseCase<DomainEntityUser, NoParams> {
  final UserRepository repository;
  GetCachedUserUseCase(this.repository);

  @override
  Future<Either<Failure, DomainEntityUser>> call(NoParams params) async {
    return await repository.getCachedUser();
  }
}
