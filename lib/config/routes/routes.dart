import 'package:flutter/material.dart';

import '../../features/mail_tm/presentation/pages/domains.dart';

class AppRouter {
  static const String domainList = '/domain_list';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case domainList:
        return MaterialPageRoute(builder: (_) =>  DomainListPage());
      default:
        return MaterialPageRoute(builder: (_) =>  DomainListPage()); // Replace with your default screen
    }
  }
}

