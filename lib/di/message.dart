import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/remote/domain_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/remote/message_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/repositories/domain_repository_imp.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/repositories/message_repository_impl.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/domain_repository.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/message_repository.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/get_domain_list.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/get_message_list.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/domain/domain_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/message/message_bloc.dart';

import 'di.dart';

void registerMessageFeature() {
  // Category BLoC and Use Cases
  sl.registerFactory(() => MessageBloc(sl()));
  sl.registerLazySingleton(() => GetRemoteMessageUseCase(repository: sl()));

  // Category Repository and Data Sources
  sl.registerLazySingleton<MessageRepository>(
        () => MessageRepositoryImpl(
      dataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<MessageRemoteDataSource>(
        () => MessageRemoteDataSourceImpl(client: sl()),
  );
}