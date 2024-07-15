import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/feature/on_bording/data/models/on_bording_model.dart';
import 'package:dalel/feature/on_bording/presentation/views/Widgets/custom_smoothpage_indicator.dart';
import 'package:flutter/material.dart';

class OnBordingWidgetBody extends StatelessWidget {
  const OnBordingWidgetBody(
      {super.key, required this.controller, this.onPageChanged});

  final PageController controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
          onPageChanged: onPageChanged,
          controller: controller,
          itemCount: onbordingData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 290,
                  width: 343,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          onbordingData[index].imagePath,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomSmoothPageIndecator(controller: controller),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  onbordingData[index].titel,
                  style: CustomTextStyles.poppins600style28
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  onbordingData[index].subTitel,
                  style: CustomTextStyles.poppins400style12,
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
