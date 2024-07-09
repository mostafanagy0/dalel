import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/feature/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndconditionWidget extends StatelessWidget {
  const TermsAndconditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: AppStrings.iHaveAgreeToOur,
                style: CustomtextStyles.pacifico400style12),
            TextSpan(
                text: AppStrings.termsAndCondition,
                style: CustomtextStyles.pacifico400style12
                    .copyWith(decoration: TextDecoration.underline))
          ]),
        )
      ],
    );
  }
}
