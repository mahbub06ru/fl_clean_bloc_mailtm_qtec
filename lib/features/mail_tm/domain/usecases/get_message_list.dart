import 'package:dartz/dartz.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/message.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/repositories/message_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/domain.dart';
import '../repositories/domain_repository.dart';

class GetRemoteMessageUseCase extends UseCase<List<MessageEntity>, NoParams> {
  final MessageRepository repository;
  GetRemoteMessageUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MessageEntity>>> call(NoParams params) async {
    return await repository.getMessages();
  }
}
