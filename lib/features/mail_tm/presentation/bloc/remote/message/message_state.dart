import 'package:equatable/equatable.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/message.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/domain.dart';

abstract class MessageState extends Equatable {
  final List<MessageEntity> message;
  const MessageState({required this.message});

  @override
  List<Object> get props => [];
}

class MessageInitial extends MessageState {
  const MessageInitial({required super.message});
  @override
  List<Object> get props => [];
}

class MessageLoading extends MessageState {
  const MessageLoading({required super.message});
  @override
  List<Object> get props => [];
}

class MessageLoaded extends MessageState {
  final List<MessageEntity> messages;

  const MessageLoaded({required this.messages}) : super(message: messages);

  @override
  List<Object> get props => [messages];
}



class MessageError extends MessageState {
  final Failure failure;
  const MessageError({required super.message, required this.failure});
  @override
  List<Object> get props => [];
}





