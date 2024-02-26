
import 'package:flutter_clean_mail_tm_qtec/di/account.dart';
import 'package:flutter_clean_mail_tm_qtec/di/login.dart';
import 'package:get_it/get_it.dart';

import 'common.dart';
import 'domain.dart';
final sl = GetIt.instance;

// Main Initialization
Future<void> init() async {

  registerDomainFeature();
  registerLoginFeature();
  registerAccountFeature();
  // Register common dependencies
  registerCommonDependencies();
}


