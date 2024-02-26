
import 'package:flutter_clean_mail_tm_qtec/di/login.dart';
import 'package:get_it/get_it.dart';

import 'common.dart';
final sl = GetIt.instance;

// Main Initialization
Future<void> init() async {
  // Register features
  // registerCategoryFeature();
  // registerProductFeature();

  registerLoginFeature();
  // registerDeliveryInfoFeature();
  // registerCartFeature();
  // registerOrderFeature();
  //
  // Register Cubits
  // registerCubits();

  // Register common dependencies
  registerCommonDependencies();
}


