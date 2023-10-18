import 'package:flutter/material.dart';
import 'package:mp_design/shared/constants/_constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;

  const CustomTextField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.green, width: 1)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.green, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.green, width: 1),
        ),
      ),
    );
  }
}
