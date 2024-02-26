import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/message/message_event.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/message/message_state.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../domain/usecases/get_message_list.dart';


class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetRemoteMessageUseCase _getMessageUseCase;

  MessageBloc(this._getMessageUseCase)
      : super(const MessageLoading(message: [])) {
    on<GetMessages>(_onLoadMessages);
  }

  void _onLoadMessages(
      GetMessages event,
      Emitter<MessageState> emit
      ) async {
    try {
      emit(const MessageLoading(message: []));
      final result = await _getMessageUseCase(NoParams());
      result.fold(
            (failure) => emit(MessageError(
          message: [],
          failure: failure,
        )),
            (messages) => emit(MessageLoaded(
          messages: messages,
        )),
      );
    } catch (e) {
      log(e.toString());
      emit(MessageError(
        message: [],
        failure: ExceptionFailure(),
      ));
    }
  }

}






