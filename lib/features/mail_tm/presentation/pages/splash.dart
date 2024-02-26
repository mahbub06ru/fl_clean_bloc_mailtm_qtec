import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../config/common/app.dart';
import '../../../../config/common/app_dimensions.dart';
import '../../../../core/constants/assets.dart';
import '../bloc/remote/login/login_bloc.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _nextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed(MainAppRouter.domain);
    /*final userState = context.read<LoginBloc>().state;
    print('userState');
    print(userState);

    if (userState is UserLogged) {
      Navigator.of(context).pushReplacementNamed(MainAppRouter.home);
    } else {
      Navigator.of(context).pushReplacementNamed(MainAppRouter.login);
    }*/
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nextScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: Center(
          child: Image.asset(AppAssets.splash,)
      ),
    );
  }
}
