import 'package:dalel/core/func/custom_tost.dart';
import 'package:dalel/core/func/navigation.dart';
import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/widgets/custom_buttom.dart';
import 'package:dalel/feature/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/feature/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/feature/auth/presentation/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotpasswordForm extends StatelessWidget {
  const CustomForgotpasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          showToast("Check Your Email To Reset Your Password");
          customReplacementNavigate(context, "/signIn");
        } else if (state is ResetPasswordFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        // authCubit == BlocProvider.of<AuthCubit>(context)
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
              key: authCubit.forgotpasswordFormkey,
              child: Column(
                children: [
                  CustomTextFormFeild(
                    labelText: AppStrings.emailAddress,
                    onChanged: (emailAddress) {
                      authCubit.emailAddress = emailAddress;
                    },
                  ),
                  const SizedBox(
                    height: 129,
                  ),
                  state is ResetPasswordlodingStete
                      ? CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )
                      : CustomButtom(
                          onPressed: () async {
                            {
                              if (authCubit.forgotpasswordFormkey.currentState!
                                  .validate()) {
                                await authCubit.resetPasswordWithLink();
                              }
                            }
                          },
                          text: AppStrings.sendResetPasswordLink),
                ],
              )),
        );
      },
    );
  }
}
