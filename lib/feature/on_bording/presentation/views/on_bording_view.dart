import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/widgets/custom_buttom.dart';
import 'package:dalel/feature/on_bording/presentation/views/Widgets/custom_nav_bar.dart';
import 'package:dalel/feature/on_bording/presentation/views/Widgets/onBording_Widget_Body.dart';
import 'package:flutter/material.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              const CustomNavBar(),
              OnBordingWidgetBody(),
              const SizedBox(
                height: 88,
              ),
              const CustomButtom(
                text: AppStrings.next,
              ),
              const SizedBox(
                height: 17,
              )
            ],
          ),
        ),
      ),
    );
  }
}
