import 'package:dalel/core/func/custom_tost.dart';
import 'package:dalel/core/func/navigation.dart';
import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/widgets/custom_buttom.dart';
import 'package:dalel/feature/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/feature/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/feature/auth/presentation/widgets/custom_text_feild.dart';
import 'package:dalel/feature/auth/presentation/widgets/forgot_password.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customReplacementNavigate(context, "/home")
              : showToast("Please Verify Your Account");
        } else if (state is SignInFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        // authCubit == BlocProvider.of<AuthCubit>(context)
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
            key: authCubit.signInFormkey,
            child: Column(
              children: [
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
                const SizedBox(
                  height: 16,
                ),
                const ForgotPassWordTextWidget(),
                const SizedBox(height: 102),
                state is SignInlodingStete
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomButtom(
                        onPressed: () {
                          {
                            if (authCubit.signInFormkey.currentState!
                                .validate()) {
                              authCubit.signInWithEmailAndPassword();
                            }
                          }
                        },
                        text: AppStrings.signIn),
              ],
            ));
      },
    );
  }
}
