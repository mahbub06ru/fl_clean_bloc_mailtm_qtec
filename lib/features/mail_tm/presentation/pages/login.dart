import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/core/router/app_router.dart';

import '../../../../config/common/app_dimensions.dart';
import '../../../../config/common/app_typography.dart';
import '../../../../config/common/space.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/login_use_case.dart';
import '../bloc/remote/login/login_bloc.dart';
import '../widgets/login/auth_error_dialog.dart';
import '../widgets/login/credential_failure_dialog.dart';
import '../widgets/login/custom_textfield.dart';
import '../widgets/login/successful_auth_dialog.dart';
import '../widgets/login/transparent_button.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(height: 1,),
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: const Center(
                  child:  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              _buildBody()

            ],
          ),
        ),
      ),

    );

  }
  Widget _buildBody(){
    return Padding(
      padding: Space.all(1, 1.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space.y!,
          buildTextFormField(_emailController, "Email Address"),
          Space.yf(1.5),
          buildTextFormField(_passwordController, "Password",
              isObscure: true),
          Space.yf(1.7),
          BlocConsumer<LoginBloc, UserState>(
            listener: (context, state) {
              if (state is UserLogged) {
                showSuccessfulAuthDialog(context, "logged in");
              } else if (state is UserLoggedFail) {
                if (state.failure is CredentialFailure) {
                  showCredentialErrorDialog(context);
                } else {
                  showAuthErrorDialog(context);
                }
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(
                      SignInUser(
                        SignInParams(
                          address: _emailController.text,
                          password: _passwordController.text,
                        ),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                    Size(
                      double.infinity,
                      AppDimensions.normalize(20),
                    ),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                  ),
                ),
                child: Text(
                  (state is UserLoading) ? "Wait..." : "Login",
                  style: AppText.h3b?.copyWith(color: Colors.white),
                ),
              );
            },

          ),
          Space.yf(1.5),
          Center(
            child: Text(
              "Don't have an Account?",
              style: AppText.b1b,
            ),
          ),
          Space.y1!,
          transparentButton(
            context: context,
            onTap: () {
              Navigator.of(context).pushNamed(MainAppRouter.account);
            },
            buttonText: "Create",
          )
        ],
      ),
    );
  }
}

