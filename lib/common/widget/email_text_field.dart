import 'package:flutter/material.dart';
import 'package:flutter_journey/core/configs/theme/app_colors.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.fillColor,
    required this.hintColor,
  });
  final Color fillColor; // AppColors.neutral5
  final Color hintColor; // AppColors.neutral2

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      style:
          Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Email Address',
        hintStyle:
            Theme.of(context).textTheme.bodyLarge!.copyWith(color: hintColor),
        filled: true,
        fillColor: fillColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: AppColors.neutral3, width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: AppColors.neutral3, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
      ),
    );
  }
}
