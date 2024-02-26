import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/usecases/sign_in_usecase.dart';
import '../../models/dummyjson_user_response_model.dart';

abstract class UserRemoteDataSource {
  Future<DummyJsonUserModel> signIn(SignInParams params);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<DummyJsonUserModel> signIn(SignInParams params) async {
    final response =
        // await client.post(Uri.parse('$baseUrl/authentication/local/sign-in'),
        await client.post(Uri.parse('https://dummyjson.com/auth/login'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: json.encode({
              // 'username': params.username,
              'username': 'atuny0',
              // 'password': params.password,
              'password': '9uQFF1Lh',
            }));
    print('statusCode');
    print(response.statusCode);
    if (response.statusCode == 200) {
      return dummyJsonUserModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure();
    } else {
      throw ServerException();
    }
  }

}
