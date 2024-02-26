import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/networkchecker/network_info.dart';
import '../../domain/entities/domain.dart';
import '../../domain/repositories/domain_repository.dart';
import '../data_sources/remote/domain_data_source.dart';


class DomainRepositoryImpl implements DomainRepository {
  final DomainRemoteDataSource dataSource;
  final NetworkInfo networkInfo;
  DomainRepositoryImpl({required this.dataSource, required this.networkInfo,});

  @override
  Future<Either<Failure, List<DomainEntity>>> getDomains() async {
    if (await networkInfo.isConnected) {
      try {
        final domains = await dataSource.getDomains();
        return Right(domains);
      } on Failure catch (failure) {
        return Left(failure);
      }
    }else {
      return Left(NetworkFailure());
    }

  }
}





