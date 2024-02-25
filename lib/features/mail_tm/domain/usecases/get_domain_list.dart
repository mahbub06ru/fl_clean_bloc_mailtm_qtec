import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/domain.dart';
import '../repositories/domain_repository.dart';

class GetDomainUseCase extends UseCase<List<DomainEntity>, NoParams> {
  final DomainRepository repository;

  GetDomainUseCase({required this.repository});

  @override
  Future<Either<Failure, List<DomainEntity>>> call(NoParams params) async {
    return await repository.getDomains();
  }
}
