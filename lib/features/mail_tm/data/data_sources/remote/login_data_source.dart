// authentication_remote_data_source.dart
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/models/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/usecases/login_use_case.dart';


abstract class LoginRemoteDataSource {
  Future<LoginModel> signIn(SignInParams params);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;
  LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginModel> signIn(SignInParams params) async {
    final response = await client.post(Uri.parse('https://api.mail.tm/token'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          // 'username': params.username,
          'address': 'mahbub06ru4@yogirt.com',
          // 'password': params.password,
          'password': '123456M@ahbub',
        }));
    print('statusCode');
    print(response.statusCode);
    if (response.statusCode == 200) {
      return loginModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure();
    } else {
      throw ServerException();
    }
  }


 /* @override
  Future<LoginEntity> login(String address, String password) async {
    final response = await client.post(
      Uri.parse('https://api.mail.tm/token'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'address': address,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return LoginEntity(
        token: jsonResponse['token'],
        id: jsonResponse['id'],
      );
    } else {
      throw Exception('Failed to login');
    }
  }*/
}
