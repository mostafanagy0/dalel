import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/core/widgets/custom_buttom.dart';
import 'package:dalel/feature/auth/presentation/widgets/custom_text_feild.dart';
import 'package:dalel/feature/auth/presentation/widgets/terms_conditions_widget.dart';
import 'package:dalel/feature/auth/presentation/widgets/welcom_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 125)),
            const SliverToBoxAdapter(
                child: WelcomeTextWidget(text: AppStrings.welcome)),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
                child: CustomtextFeild(
              labelText: AppStrings.fristName,
            )),
            const SliverToBoxAdapter(
                child: CustomtextFeild(
              labelText: AppStrings.lastName,
            )),
            const SliverToBoxAdapter(
                child: CustomtextFeild(
              labelText: AppStrings.emailAddress,
            )),
            const SliverToBoxAdapter(
                child: CustomtextFeild(
              labelText: AppStrings.password,
            )),
            const SliverToBoxAdapter(
              child: TermsAndconditionWidget(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 88)),
            SliverToBoxAdapter(
              child: CustomButtom(onPressed: () {}, text: AppStrings.signUp),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                  text1: AppStrings.alreadyHaveAnAccount,
                  text2: AppStrings.signUp),
            )
          ],
        ),
      ),
    );
  }
}

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
