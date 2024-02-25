import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../features/mail_tm/data/data_sources/remote/domain_data_source.dart';
import '../features/mail_tm/data/repositories/domain_repository_imp.dart';
import '../features/mail_tm/domain/repositories/domain_repository.dart';
import '../features/mail_tm/domain/usecases/get_domain_list.dart';
import '../features/mail_tm/presentation/bloc/remote/domain/domain_bloc.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  // Registering http.Client as a singleton
  getIt.registerSingleton(http.Client());

  // Registering data sources
  getIt.registerSingleton<DomainDataSource>(
    DomainDataSourceImpl(client: getIt()),
  );

  // Registering repositories
  getIt.registerSingleton<DomainRepository>(
    DomainRepositoryImpl(dataSource: getIt()),
  );

  // Registering use cases
  getIt.registerSingleton<GetDomainUseCase>(
    GetDomainUseCase(repository: getIt()),
  );

  // Registering BLoCs
  getIt.registerFactory(
        () => DomainBloc(domainUsecase: getIt()),
  );
}

