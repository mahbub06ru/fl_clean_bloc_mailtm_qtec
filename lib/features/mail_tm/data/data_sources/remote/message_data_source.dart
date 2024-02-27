import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/message.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class MessageRemoteDataSource {
  Future<List<MessageModel>> getMessages();
}

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final http.Client client;

  MessageRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MessageModel>> getMessages() async {
    var authToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE3MDg4NDcwMzgsInJvbGVzIjpbIlJPTEVfVVNFUiJdLCJhZGRyZXNzIjoibWFoYnViMDZydTRAeW9naXJ0LmNvbSIsImlkIjoiNjVkYWVlYmFjMTViNjMxNjY2MGI3YWQyIiwibWVyY3VyZSI6eyJzdWJzY3JpYmUiOlsiL2FjY291bnRzLzY1ZGFlZWJhYzE1YjYzMTY2NjBiN2FkMiJdfX0.ebO7EAorbRSQrDZoeFqrewnAPJeRcLKvuwoo7EUyexVJdCCQkdbkJPr-rIOYf_8RSwvnJwkewL_tE073itnsRg";
    final response = await client.get(
      Uri.parse('https://api.mail.tm/messages'),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'},
    );

    print('statusCodeM' );
    print(response.statusCode );

    if (response.statusCode == 200) {
      final List<dynamic> domainsJson = json.decode(response.body)['hydra:member'];
      print(domainsJson);
      return domainsJson.map((domainJson) => MessageModel.fromJson(domainJson)).toList();
    } else {
      throw Exception('Failed to load messages');
    }
  }
}


