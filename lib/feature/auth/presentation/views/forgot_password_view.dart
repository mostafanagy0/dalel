import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/feature/auth/presentation/widgets/custom_forgot_password_form.dart';
import 'package:dalel/feature/auth/presentation/widgets/forgot_password_sub_titel.dart';
import 'package:dalel/feature/auth/presentation/widgets/forgote_password_image.dart';
import 'package:dalel/feature/auth/presentation/widgets/welcom_text_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 108)),
          SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.forgotPassword),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: ForgotPasswordImage(),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: ForgotPasswordSubTitle(),
          ),
          SliverToBoxAdapter(
            child: CustomForgotpasswordForm(),
          )
        ],
      ),
    );
  }
}
