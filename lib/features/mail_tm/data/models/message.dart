import 'dart:convert';

import '../../domain/entities/message.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    required String id,
    required String subject,
    required String intro,
  }) : super(
    id: id,
    subject: subject,
    intro: intro,
  );

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      subject: json['subject'],
      intro: json['intro'],
    );
  }

}
