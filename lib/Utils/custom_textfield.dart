import 'package:flight_booking_app/Utils/Resources/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, required this.labelText, this.keyBoardType});

  final TextEditingController controller;

  final String labelText;

  final TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        style: const TextStyle(
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
        ),
        controller: controller,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.airplane_ticket_rounded,
            color: AppColors.kWhite,
          ),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(
            width: 2,
            color: AppColors.kWhite,
          )),
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 20,
            color: AppColors.kWhite,
            fontWeight: FontWeight.w600,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.kWhite),
          ),
        ),
      ),
    );
  }
}
