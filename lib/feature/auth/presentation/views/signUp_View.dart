import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/feature/auth/presentation/widgets/custom_signup_form.dart';
import 'package:dalel/feature/auth/presentation/widgets/have_account_widget.dart';
import 'package:dalel/feature/auth/presentation/widgets/welcom_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 125)),
            SliverToBoxAdapter(
                child: WelcomeTextWidget(text: AppStrings.welcome)),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: CustomSignUpForm()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
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
