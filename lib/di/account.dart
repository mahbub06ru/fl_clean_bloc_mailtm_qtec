import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/local/account_local_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/remote/account_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/remote/login_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/repositories/account_repository_impl.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/repositories/login_repository_impl.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/account_repository.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/login_repository.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/account_use_case.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/get_cached_account_usecase.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/login_use_case.dart';

import '../features/mail_tm/data/data_sources/local/login_local_data_source.dart';
import '../features/mail_tm/domain/usecases/get_cached_login_usecase.dart';
import '../features/mail_tm/presentation/bloc/remote/account/account_bloc.dart';
import '../features/mail_tm/presentation/bloc/remote/login/login_bloc.dart';
import 'di.dart';

void registerAccountFeature() {
  // User BLoC and Use Cases
  sl.registerFactory(() => AccountBloc(sl(), sl()));
  sl.registerLazySingleton(() => GetCachedAccountUseCase(sl()));
  sl.registerLazySingleton(() => AccountUseCase(sl()));

  // User Repository and Data Sources
  sl.registerLazySingleton<AccountRepository>(
        () => AccountRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<AccountLocalDataSource>(
        () => AccountLocalDataSourceImpl(sharedPreferences: sl(), secureStorage: sl()),
  );
  sl.registerLazySingleton<AccountRemoteDataSource>(
        () => AccountRemoteDataSourceImpl(client: sl()),
  );
}
