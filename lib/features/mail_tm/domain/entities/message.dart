import 'package:equatable/equatable.dart';
class MessageEntity extends Equatable {
  final String id;
  final String subject;
  final String intro;

  const MessageEntity({
    required this.id,
    required this.subject,
    required this.intro,
  });

  @override
  List<Object?> get props => [
    id,
    subject,
    intro
  ];
}
