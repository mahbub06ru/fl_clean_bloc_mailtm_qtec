import 'package:flutter/material.dart';

import '../../../../../config/common/app_typography.dart';
import '../../../../../config/common/space.dart';
import '../../../../../core/constants/colors.dart';

Widget transparentButton({
  required BuildContext context,
  required void Function() onTap,
  required String buttonText,
}) {
  return SizedBox(
    width: double.infinity,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Space.vf(.77),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.CommonCyan),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: AppText.h3b?.copyWith(color: AppColors.CommonCyan),
          ),
        ),
      ),
    ),
  );
}

