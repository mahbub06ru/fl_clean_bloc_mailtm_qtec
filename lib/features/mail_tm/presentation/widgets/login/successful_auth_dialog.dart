import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/core/router/app_router.dart';

import '../../../../../config/common/app_dimensions.dart';
import '../../../../../config/common/app_typography.dart';
import '../../../../../config/common/space.dart';
import '../../../../../config/routes/routes.dart';
import '../../bloc/remote/login/login_bloc.dart';


Future<void> showSuccessfulAuthDialog(BuildContext context, String text) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          height: AppDimensions.normalize(77),
          padding: Space.all(1, 1.05),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SUCCESSFULLY ${text.toUpperCase()}",
                  style: AppText.b1b,
                ),
                Space.yf(.6),
                Text(
                  "Congratulations,\nYour Account Has Been Successfully $text!",
                  style: AppText.b1?.copyWith(height: 1.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<LoginBloc, UserState>(
                        builder: (context, state) {
                          if (state is UserLogged) {
                            return  GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(MainAppRouter.home);
                              },
                              child: Text(
                                "Go to Home",
                                style: AppText.b1b,
                              ),
                            );
                          } else {
                            return const Text(
                              "Ok",
                            );
                          }
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
