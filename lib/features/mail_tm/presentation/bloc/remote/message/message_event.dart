import 'package:equatable/equatable.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();
}
class GetMessages extends MessageEvent {
  const GetMessages();

  @override
  List<Object> get props => [];
}
/*
abstract class MessageEvent extends Equatable {
  const MessageEvent();
}

class GetMessage extends MessageEvent {
  const GetMessage();

  @override
  List<Object> get props => [];
}*/
