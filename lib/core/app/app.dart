import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/core/router/app_router.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/account/account_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/domain/domain_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/domain/domain_event.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/message/message_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/message/message_event.dart';

import '../../features/mail_tm/presentation/bloc/remote/login/login_bloc.dart';
import '../constants/colors.dart';
import '../../di/di.dart' as di;
import '../constants/strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<LoginBloc>()..add(GetUser()),
        ),
        BlocProvider(
          create: (context) => di.sl<AccountBloc>()..add(GetAccount()),
        ),
        BlocProvider(
          create: (context) => di.sl<DomainBloc>()..add(const GetDomains()),
        ),
        BlocProvider(
          create: (context) => di.sl<MessageBloc>()..add(const GetMessages()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        onGenerateRoute: MainAppRouter.onGenerateRoute,
        theme: ThemeData.light().copyWith(
          canvasColor: AppColors.CommonCyan,
          appBarTheme: AppBarTheme(
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              toolbarHeight: 56,
              centerTitle: true,
              iconTheme:
                  const IconThemeData(color: AppColors.CommonCyan, size: 30)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.CommonCyan,
              minimumSize: const Size(170, 50),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          )),
          iconTheme: const IconThemeData(color: AppColors.CommonCyan, size: 30),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.CommonCyan,
          ),
        ),
        initialRoute: MainAppRouter.splash,
      ),
    );
  }
}
