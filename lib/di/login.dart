import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/remote/login_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/repositories/login_repository_impl.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/login_repository.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/login_use_case.dart';

import '../features/mail_tm/data/data_sources/local/login_local_data_source.dart';
import '../features/mail_tm/domain/usecases/get_cached_login_usecase.dart';
import '../features/mail_tm/presentation/bloc/remote/login/login_bloc.dart';
import 'di.dart';

void registerLoginFeature() {
  // User BLoC and Use Cases
  sl.registerFactory(() => LoginBloc(sl(), sl()));
  sl.registerLazySingleton(() => GetCachedLoginUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // User Repository and Data Sources
  sl.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<LoginLocalDataSource>(
        () => LoginLocalDataSourceImpl(sharedPreferences: sl(), secureStorage: sl()),
  );
  sl.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl(client: sl()),
  );
}
