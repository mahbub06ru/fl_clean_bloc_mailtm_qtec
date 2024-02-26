import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/networkchecker/network_info.dart';
import '../../domain/entities/dummy_user.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/local/user_local_data_source.dart';
import '../data_sources/remote/user_remote_data_source.dart';
import '../models/dummyjson_user_response_model.dart';


typedef _DataSourceChooser = Future<DummyJsonUserModel> Function();

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DomainEntityUser>> signIn(params) async {
    return await _authenticate(() {
      return remoteDataSource.signIn(params);
    });
  }

  Future<Either<Failure, DomainEntityUser>> _authenticate(
      _DataSourceChooser getDataSource,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        final domainUser = DomainEntityUser(
          id: remoteResponse.id,
          username: remoteResponse.username,
          email: remoteResponse.email,
          firstName: remoteResponse.firstName,
          lastName: remoteResponse.lastName,
          gender: remoteResponse.gender,
          image: remoteResponse.image,
          token: remoteResponse.token,
        );

        localDataSource.saveToken(remoteResponse.token!);
        localDataSource.saveUser(domainUser);

        return Right(domainUser);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }
  @override
  Future<Either<Failure, DomainEntityUser>> getCachedUser() async {
    try {
      final dummyUser = await localDataSource.getUser();
      final domainUser = DomainEntityUser(
        id: dummyUser.id,
        username: dummyUser.username,
        email: dummyUser.email,
        firstName: dummyUser.firstName,
        lastName: dummyUser.lastName,
        gender: dummyUser.gender,
        image: dummyUser.image,
        token: dummyUser.token,
      );

      return Right(domainUser);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

}
