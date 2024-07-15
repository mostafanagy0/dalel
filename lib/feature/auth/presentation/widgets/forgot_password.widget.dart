import 'package:dalel/core/func/navigation.dart';
import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgotPassWordTextWidget extends StatelessWidget {
  const ForgotPassWordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customReplacementNavigate(context, 'path');
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          AppStrings.forgotPassword,
          style: CustomTextStyles.poppins600style28.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
