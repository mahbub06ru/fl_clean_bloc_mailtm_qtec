import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/core/router/app_router.dart';

import '../bloc/remote/login/login_bloc.dart';
import '../widgets/login/transparent_button.dart';
import '../widgets/login/unlogged_profile_container.dart';
import '../widgets/login/user_logged_profile_container.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          BlocBuilder<LoginBloc, UserState>(
            builder: (context, state) {
              if (state is UserLogged) {
                return userLoggedProfileContainer(context,
                    "${state.user.token}!", state.user.id);
              } else {
                return unloggedProfileContainer(context);
              }
            },
          ),

          transparentButton(
            context: context,
            onTap: () {
              Navigator.of(context).pushNamed(MainAppRouter.account);
            },
            buttonText: "Acc",
          ),

          transparentButton(
            context: context,
            onTap: () {
              Navigator.of(context).pushNamed(MainAppRouter.message);
            },
            buttonText: "Message",
          )
        ],
      ),
    );
  }
}
