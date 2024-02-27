import 'package:flutter/material.dart';

import '../app_dimensions.dart';
import '../app_typography.dart';
import '../../../core/constants/colors.dart';


PreferredSizeWidget CustomAppBar(
  String title,
  BuildContext context, {
  bool doesHasCartIcom = false,
  bool automaticallyImplyLeading = false,
}) {
  return PreferredSize(
    preferredSize: Size(double.infinity, AppDimensions.normalize(30)),
    child: Padding(
      padding: EdgeInsets.only(top: AppDimensions.normalize(10)),
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: Text(
          title,
          style: AppText.b1b?.copyWith(color: AppColors.GreyText),
        ),

      ),
    ),
  );
}
