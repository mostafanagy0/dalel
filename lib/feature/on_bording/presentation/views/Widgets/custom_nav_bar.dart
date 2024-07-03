import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        AppStrings.skip,
        style: CustomtextStyles.poppins400style12
            .copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
