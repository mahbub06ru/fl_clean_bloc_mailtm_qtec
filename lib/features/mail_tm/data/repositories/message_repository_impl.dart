import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/local/login_local_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/remote/message_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/models/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/models/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/models/message.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/message.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/message_repository.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/account_use_case.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/login_use_case.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/networkchecker/network_info.dart';
import '../../domain/repositories/account_repository.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/local/account_local_data_source.dart';
import '../data_sources/remote/account_data_source.dart';
import '../data_sources/remote/login_data_source.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource dataSource;
  final NetworkInfo networkInfo;

  MessageRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<MessageEntity>>> getMessages() async {
    if (await networkInfo.isConnected) {
      try {
        final messages = await dataSource.getMessages();
        return Right(messages); // Assuming dataSource.getMessages returns List<MessageModel>
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}


