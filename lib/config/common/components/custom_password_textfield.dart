import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  PasswordFormField({
    required this.controller,
    required this.labelText,
  });

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isObscure,
        validator: (String? val) {
          if (val == null || val.isEmpty) {
            return 'This field can\'t be empty';
          }
          return null;
        },
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12.0),
          border: InputBorder.none,
          hintText: "Enter ${widget.labelText}",
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          ),
        ),
      ),
    );
  }
}
