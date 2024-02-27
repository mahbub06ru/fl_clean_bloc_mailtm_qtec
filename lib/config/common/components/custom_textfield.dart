
import '../space.dart';
import '../../../core/constants/colors.dart';

import 'package:flutter/material.dart';


Widget buildTextFormField(
    TextEditingController controller,
    String labelText, {
      bool isObscure = false,
    }) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white, // Set your desired background color
      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
    ),
    child: TextFormField(
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
        border: InputBorder.none, // Remove the default border
        hintText: "Enter $labelText",
        hintStyle: const TextStyle(
          fontSize: 15,
          color: AppColors.GreyText,
          fontWeight: FontWeight.w400,
        ),
        // You can add additional styling options here if needed
      ),
    ),
  );
}

