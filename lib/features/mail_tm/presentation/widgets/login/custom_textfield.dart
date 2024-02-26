
import '../../../../../config/common/space.dart';
import '../../../../../core/constants/colors.dart';

import 'package:flutter/material.dart';


Widget buildTextFormField(TextEditingController controller, String labelText,
    {bool isObscure = false}) {
  return TextFormField(
    controller: controller,
    obscureText: isObscure,
    validator: (String? val) {
      if (val == null || val.isEmpty) {
        return 'This field can\'t be empty';
      }
      return null;
    },
    cursorColor: AppColors.CommonCyan,
    decoration: InputDecoration(
      contentPadding: Space.all(),
      border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
      hintText: "Enter your $labelText",
      hintStyle: const TextStyle(
        fontSize: 12,
        color: AppColors.GreyText,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
