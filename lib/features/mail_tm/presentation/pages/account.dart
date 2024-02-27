import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/core/router/app_router.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/account_use_case.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/account/account_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/pages/login.dart';

import '../../../../config/common/app_dimensions.dart';
import '../../../../config/common/app_typography.dart';
import '../../../../config/common/components/custom_container.dart';
import '../../../../config/common/components/custom_password_textfield.dart';
import '../../../../config/common/space.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/login_use_case.dart';
import '../bloc/remote/login/login_bloc.dart';
import '../widgets/account/successful_acc_dialog.dart';
import '../widgets/login/auth_error_dialog.dart';
import '../widgets/login/credential_failure_dialog.dart';
import '../../../../config/common/components/custom_textfield.dart';
import '../widgets/login/successful_auth_dialog.dart';
import '../../../../config/common/components/transparent_button.dart';


class AccountScreen extends StatefulWidget {
  final String domain;
  AccountScreen(this.domain, {super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
              const CustomContainer(text: createEmail,),
              Space.yf(3),
              _buildBody(widget.domain),

            ],
          ),
        ),
      ),

    );
  }

  Widget _buildBody(domain){
    return Padding(
      padding: Space.all(1, 1.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: buildTextFormField(_emailController, "Email")),
              Expanded(child: Text('@$domain',style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold
              ),),),
            ],
          ),
          Space.yf(1.5),
          PasswordFormField(controller: _passwordController,labelText: 'Password',),
          Space.y2!,
          BlocConsumer<AccountBloc, AccountState>(
            listener: (context, state) {
              if (state is AccountLoaded) {
                var address = state.user.address;
                showSuccessfulAccDialog(context, "Created",widget.domain);
              } else if (state is AccountLoadedFail) {
                if (state.failure is CredentialFailure) {
                  print('state1');
                  showCredentialErrorDialog(context);
                } else {
                  print('state2');
                  // showAuthErrorDialog(context);
                }
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AccountBloc>().add(
                      CreateAccount(
                        JsonParams(
                          address: '${_emailController.text}@'+domain,
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
                  (state is UserLoading) ? "Wait..." : "Create",
                  style: AppText.h3b?.copyWith(color: Colors.white),
                ),
              );
            },
          ),
          Space.yf(1.5),
          Row(
            children: [
              const Text(alreadyHave),
              const SizedBox(width: 10,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  LoginScreen(domain),
                  ));
                },
                child: const Text(login,style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold
                ),),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
