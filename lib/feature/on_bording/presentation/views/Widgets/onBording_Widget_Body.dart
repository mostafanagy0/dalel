import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/feature/on_bording/presentation/views/Widgets/custom_smoothpage_indicator.dart';
import 'package:flutter/material.dart';

class OnBordingWidgetBody extends StatelessWidget {
  OnBordingWidgetBody({super.key});
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
          controller: _controller,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 290,
                  width: 343,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          Assets.assetsImagesOnBoarding1,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomSmoothPageIndecator(controller: _controller),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Explore The history withDalel in a smart way',
                  style: CustomtextStyles.poppins600style28
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Using our app’s history libraries you can find many historical periods ',
                  style: CustomtextStyles.poppins400style12,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          }),
    );
  }
}
