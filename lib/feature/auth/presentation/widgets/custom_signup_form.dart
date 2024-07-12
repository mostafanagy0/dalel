import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/utils/app_colors.dart';
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
      listener: (context, state) {},
      builder: (context, state) {
        // authCubit == BlocProvider.of<AuthCubit>(context)
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
            key: authCubit.signupFormkey,
            child: Column(
              children: [
                CustomTextFormFeild(
                  labelText: AppStrings.fristName,
                  onChanged: (fristName) {
                    authCubit.fristName = fristName;
                  },
                ),
                CustomTextFormFeild(
                  labelText: AppStrings.lastName,
                  onChanged: (lastName) {
                    authCubit.lastName = lastName;
                  },
                ),
                CustomTextFormFeild(
                  labelText: AppStrings.emailAddress,
                  onChanged: (emailAddress) {
                    authCubit.emailAddress = emailAddress;
                  },
                ),
                CustomTextFormFeild(
                  labelText: AppStrings.password,
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                ),
                const TermsAndconditionWidget(),
                const SizedBox(height: 88),
                CustomButtom(
                    color:
                        authCubit.updateTermesAndConditionCheckBoxValue == false
                            ? AppColors.grey
                            : null,
                    onPressed: () {
                      if (authCubit.updateTermesAndConditionCheckBoxValue ==
                          true) {
                        if (authCubit.signupFormkey.currentState!.validate()) {
                          authCubit.signUpWithEmailAndPassWord();
                        }
                      }
                    },
                    text: AppStrings.signUp),
              ],
            ));
      },
    );
  }
}
