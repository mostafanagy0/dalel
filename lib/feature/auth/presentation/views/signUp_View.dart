import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/widgets/custom_buttom.dart';
import 'package:dalel/feature/auth/presentation/widgets/custom_text_feild.dart';
import 'package:dalel/feature/auth/presentation/widgets/have_account_widget.dart';
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
                  text2: AppStrings.signIn),
            )
          ],
        ),
      ),
    );
  }
}
