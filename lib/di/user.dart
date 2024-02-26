import '../features/mail_tm/data/data_sources/local/user_local_data_source.dart';
import '../features/mail_tm/data/data_sources/remote/user_remote_data_source.dart';
import '../features/mail_tm/data/repositories/dummy_user_repository_impl.dart';
import '../features/mail_tm/domain/repositories/user_repository.dart';
import '../features/mail_tm/domain/usecases/get_cached_user_usecase.dart';
import '../features/mail_tm/domain/usecases/sign_in_usecase.dart';
import '../features/mail_tm/presentation/bloc/remote/login/user_bloc.dart';
import 'di.dart';

void registerUserFeature() {
  // User BLoC and Use Cases
  sl.registerFactory(() => UserBloc(sl(), sl()));
  sl.registerLazySingleton(() => GetCachedUserUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  // User Repository and Data Sources
  sl.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<UserLocalDataSource>(
        () => UserLocalDataSourceImpl(sharedPreferences: sl(), secureStorage: sl()),
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl(client: sl()),
  );
}
