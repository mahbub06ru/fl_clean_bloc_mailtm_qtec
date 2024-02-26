import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/remote/login/user_bloc.dart';
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
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLogged) {
                return userLoggedProfileContainer(context,
                    "${state.user.firstName}!", state.user.email!);
              } else {
                return unloggedProfileContainer(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
