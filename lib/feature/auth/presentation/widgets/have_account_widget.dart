import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget(
      {super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: text1, style: CustomtextStyles.pacifico400style12),
        TextSpan(
            text: text2,
            style: CustomtextStyles.pacifico400style12
                .copyWith(color: AppColors.lightGrey))
      ])),
    );
  }
}
