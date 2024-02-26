import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/domain.dart';
import '../../domain/repositories/domain_repository.dart';
import '../data_sources/remote/domain_data_source.dart';


class DomainRepositoryImpl implements DomainRepository {
  final DomainRemoteDataSource dataSource;

  DomainRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<DomainEntity>>> getDomains() async {
    try {
      final domains = await dataSource.getDomains();
      return Right(domains);
    } catch (e) {
      // Handle exceptions
      return Left(ServerFailure());
    }
  }
}





