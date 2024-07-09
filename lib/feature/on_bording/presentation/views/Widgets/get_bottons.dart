import 'package:dalel/core/func/navigation.dart';
import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/core/widgets/custom_buttom.dart';
import 'package:dalel/feature/on_bording/data/models/on_bording_model.dart';
import 'package:dalel/feature/on_bording/presentation/views/functions/on_bording.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentIndex, required this.controller});

  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == onbordingData.length - 1) {
      return Column(
        children: [
          CustomButtom(
            text: AppStrings.createAccount,
            onPressed: () {
              onBordingVisited();
              customReplacementNavigate(context, '/signUp');
            },
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              onBordingVisited();
              customReplacementNavigate(context, '/signIn');
            },
            child: Text(
              AppStrings.loginNow,
              style: CustomtextStyles.poppins400style12
                  .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
    } else {
      return CustomButtom(
        text: AppStrings.next,
        onPressed: () {
          controller.nextPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceIn);
        },
      );
    }
  }
}
