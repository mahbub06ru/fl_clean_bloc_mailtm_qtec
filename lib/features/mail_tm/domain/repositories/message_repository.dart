import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/message.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/account_use_case.dart';

import '../../../../core/errors/failures.dart';
import '../usecases/login_use_case.dart';

abstract class MessageRepository {
  Future<Either<Failure, List<MessageEntity>>> getMessages();
}
