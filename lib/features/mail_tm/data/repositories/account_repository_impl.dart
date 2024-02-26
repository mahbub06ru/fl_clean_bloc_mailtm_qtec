import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/local/login_local_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/models/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/models/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/account_use_case.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/login_use_case.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/networkchecker/network_info.dart';
import '../../domain/repositories/account_repository.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/local/account_local_data_source.dart';
import '../data_sources/remote/account_data_source.dart';
import '../data_sources/remote/login_data_source.dart';

typedef _DataSourceChooser = Future<AccountModel> Function();

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDataSource remoteDataSource;
  final AccountLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AccountRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });


  Future<Either<Failure, AccountEntity>> _authenticate(
      _DataSourceChooser getDataSource,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        final entity = AccountEntity(
          id: remoteResponse.id,
          address: remoteResponse.address,
        );

        localDataSource.saveAccount(entity);

        return Right(entity);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, AccountEntity>> create(JsonParams params) async{
    return await _authenticate(() {
      return remoteDataSource.createAccount(params);
    });
  }

  @override
  Future<Either<Failure, AccountEntity>> getCachedAccount() async{
    try {
      final account = await localDataSource.getAccount();
      final entity = AccountEntity(
        id: account.id,
        address: account.address,
      );

      return Right(entity);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }





}
