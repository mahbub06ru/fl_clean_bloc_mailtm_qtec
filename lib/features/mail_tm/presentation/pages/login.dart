import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/common/app_dimensions.dart';
import '../../../../config/common/app_typography.dart';
import '../../../../config/common/space.dart';
import '../../../../core/constants/colors.dart';
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
      // appBar: CustomAppBar("LOGIN", context, automaticallyImplyLeading: true),
      appBar: AppBar(title: const Text('Login'),automaticallyImplyLeading: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: Space.all(1, 1.3),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LOGIN",
                  style: AppText.h2b?.copyWith(color: AppColors.CommonCyan),
                ),
                Space.y!,
                Text(
                  "Login Into Your Account",
                  style: AppText.h3?.copyWith(color: AppColors.GreyText),
                ),
                Space.y2!,
                Text(
                  "Email Address*",
                  style: AppText.b1b,
                ),
                Space.y!,
                buildTextFormField(_emailController, "Email Address"),
                Space.yf(1.5),
                Text(
                  "Password*",
                  style: AppText.b1b,
                ),
                Space.y!,
                buildTextFormField(_passwordController, "Password",
                    isObscure: true),
                Space.y1!,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password",
                      style: AppText.h3?.copyWith(color: AppColors.CommonCyan),
                    )
                  ],
                ),
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
                    "Don’t have an Account?",
                    style: AppText.b1b,
                  ),
                ),
                Space.y1!,
                transparentButton(
                  context: context,
                  onTap: () {
                    // Navigator.of(context).pushNamed(AppRouter.signup);
                  },
                  buttonText: "Signup",
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
