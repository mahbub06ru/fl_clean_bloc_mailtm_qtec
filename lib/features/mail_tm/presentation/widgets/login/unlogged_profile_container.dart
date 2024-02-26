import 'package:flutter/material.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/widgets/login/transparent_button.dart';

import '../../../../../config/common/app_typography.dart';
import '../../../../../config/common/space.dart';
import '../../../../../config/routes/routes.dart';


Widget unloggedProfileContainer(BuildContext context) {
  return Container(
    padding: Space.all(1.3, .7),
    width: double.infinity,
   /* decoration: BoxDecoration(
      image: DecorationImage(
        image: const AssetImage(AppAssets.Profile_bg_png),
        fit: BoxFit.fill,
        colorFilter:
            ColorFilter.mode(Colors.grey.shade700, BlendMode.colorBurn),
      ),
    ),*/
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Space.y1!,
       /* SvgPicture.asset(
          AppAssets.Profile,
          colorFilter:
              const ColorFilter.mode(AppColors.CommonCyan, BlendMode.srcIn),
          height: AppDimensions.normalize(19),
        ),*/
        Space.y1!,
        Text(
          "Login/Signup",
          style: AppText.h2b,
        ),
        Space.yf(.9),
        Text(
          "Join The Hub!",
          style: AppText.b1,
        ),
        Space.yf(1.2),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(AppRouter.login);
            },
            child: Text(
              "Login",
              style: AppText.h3b?.copyWith(color: Colors.white),
            ),
          ),
        ),
        Space.yf(1.1),
        transparentButton(
          context: context,
          onTap: () {
            // Navigator.of(context).pushNamed(AppRouter.signup);
          },
          buttonText: "Signup",
        ),
        Space.yf(.6)
      ],
    ),
  );
}
