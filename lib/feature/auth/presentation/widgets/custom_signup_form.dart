import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/widgets/custom_buttom.dart';
import 'package:dalel/feature/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/feature/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/feature/auth/presentation/widgets/custom_text_feild.dart';
import 'package:dalel/feature/auth/presentation/widgets/terms_conditions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Form(
            child: Column(
          children: [
            CustomTextFormFeild(
              labelText: AppStrings.fristName,
              onChanged: (fristName) {
                BlocProvider.of<AuthCubit>(context).fristName = fristName;
              },
            ),
            CustomTextFormFeild(
              labelText: AppStrings.lastName,
              onChanged: (lastName) {
                BlocProvider.of<AuthCubit>(context).lastName = lastName;
              },
            ),
            CustomTextFormFeild(
              labelText: AppStrings.emailAddress,
              onChanged: (emailAddress) {
                BlocProvider.of<AuthCubit>(context).emailAddress = emailAddress;
              },
            ),
            CustomTextFormFeild(
              labelText: AppStrings.password,
              onChanged: (password) {
                BlocProvider.of<AuthCubit>(context).password = password;
              },
            ),
            const TermsAndconditionWidget(),
            const SizedBox(height: 88),
            CustomButtom(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context)
                      .signUpWithEmailAndPassWord();
                },
                text: AppStrings.signUp),
          ],
        ));
      },
    );
  }
}
