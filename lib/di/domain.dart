import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/remote/domain_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/repositories/domain_repository_imp.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/domain_repository.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/get_domain_list.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/domain/domain_bloc.dart';

import 'di.dart';

void registerDomainFeature() {
  // Category BLoC and Use Cases
  sl.registerFactory(() => DomainBloc(sl()));
  sl.registerLazySingleton(() => GetRemoteDomainUseCase(repository: sl()));

  // Category Repository and Data Sources
  sl.registerLazySingleton<DomainRepository>(
        () => DomainRepositoryImpl(
      dataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<DomainRemoteDataSource>(
        () => DomainRemoteDataSourceImpl(client: sl()),
  );
}