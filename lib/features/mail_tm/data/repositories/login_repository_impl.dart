import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/local/login_local_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/models/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/login_use_case.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/networkchecker/network_info.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/remote/login_data_source.dart';

typedef _DataSourceChooser = Future<LoginModel> Function();

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginEntity>> signIn(params) async {
    return await _authenticate(() {
      return remoteDataSource.signIn(params);
    });
  }


  Future<Either<Failure, LoginEntity>> _authenticate(
      _DataSourceChooser getDataSource,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        final domainUser = LoginEntity(
          token: remoteResponse.token,
          id: remoteResponse.id
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
  Future<Either<Failure, LoginEntity>> getCachedUser() async {
    try {
      final dummyUser = await localDataSource.getUser();
      final domainUser = LoginEntity(
        token: dummyUser.token,
        id: dummyUser.id,
      );

      return Right(domainUser);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }




}
