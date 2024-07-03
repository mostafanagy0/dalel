import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, this.color, required this.text});
  final Color? color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          text,
          style: CustomtextStyles.poppins600style28
              .copyWith(fontSize: 16, color: AppColors.offWhite),
        ),
      ),
    );
  }
}
