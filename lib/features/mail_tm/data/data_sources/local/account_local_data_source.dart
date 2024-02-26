
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/data_sources/local/login_local_data_source.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/data/models/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/entities/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/exceptions.dart';

abstract class AccountLocalDataSource {
  Future<AccountModel> getAccount();
  Future<void> saveAccount(AccountEntity  user);
  Future<void> clearCache();
}

const cachedAccount = 'ACCOUNT';

class AccountLocalDataSourceImpl implements AccountLocalDataSource {
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;
  AccountLocalDataSourceImpl(
      {required this.sharedPreferences, required this.secureStorage});

  @override
  Future<AccountModel> getAccount() async {
    final jsonString = sharedPreferences.getString(cachedAccount);
    if (jsonString != null) {
      return Future.value(accountModelFromJson(jsonString));
    } else {
      throw CacheException();
    }
  }


  @override
  Future<void> clearCache() async {
    await secureStorage.deleteAll();
    await sharedPreferences.remove(cachedAccount);
  }

  @override
  Future<void> saveAccount(AccountEntity user) {
    // Convert DomainEntityUser to DummyJsonUserModel
    final data = AccountModel(
      id: user.id,
      address: user.address,
    );

    return sharedPreferences.setString(
      cachedAccount,
      accountModelToJson(data),
    );
  }

}
