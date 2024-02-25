import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/domain.dart';

abstract class DomainRepository {
  Future<Either<Failure, List<DomainEntity>>> getDomains();
}
