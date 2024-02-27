// authentication_remote_data_source.dart
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/models/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/models/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/account_use_case.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/usecases/login_use_case.dart';


abstract class AccountRemoteDataSource {
  Future<AccountModel> createAccount(JsonParams params);
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final http.Client client;
  AccountRemoteDataSourceImpl({required this.client});

  @override
  Future<AccountModel> createAccount(JsonParams params) async {
    final response = await client.post(Uri.parse('https://api.mail.tm/accounts'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'address': params.address,
          // 'address': 'mahbub06ru4@yogirt.com',
          'password': params.password,
          // 'password': '123456M@ahbub',
        }));
    print('statusCodeA');
    print(params.address);
    print(params.password);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return accountModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure();
    } else {
      throw ServerException();
    }
  }

}
