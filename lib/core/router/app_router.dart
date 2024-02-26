import 'package:flutter/material.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/pages/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/pages/messages.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/pages/splash.dart';

import '../../features/mail_tm/presentation/pages/domains.dart';
import '../../features/mail_tm/presentation/pages/home_page.dart';
import '../../features/mail_tm/presentation/pages/login.dart';
import '../errors/exceptions.dart';

sealed class MainAppRouter {
  static const String splash = '/';
  static const String domain = '/domain';
  static const String account = '/account';
  static const String login = '/login';
  static const String message = '/message';
  static const String home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case domain:
        return MaterialPageRoute(builder: (_) => const DomainListPage());
      case account:
        return MaterialPageRoute(builder: (_) => const AccountScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case message:
        return MaterialPageRoute(builder: (_) => const MessageListPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
