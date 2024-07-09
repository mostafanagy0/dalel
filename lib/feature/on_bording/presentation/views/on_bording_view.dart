import 'package:dalel/core/func/navigation.dart';
import 'package:dalel/feature/on_bording/presentation/views/Widgets/custom_nav_bar.dart';
import 'package:dalel/feature/on_bording/presentation/views/Widgets/get_bottons.dart';
import 'package:dalel/feature/on_bording/presentation/views/Widgets/onBording_Widget_Body.dart';
import 'package:dalel/feature/on_bording/presentation/views/functions/on_bording.dart';
import 'package:flutter/material.dart';

class OnBordingView extends StatefulWidget {
  const OnBordingView({super.key});

  @override
  State<OnBordingView> createState() => _OnBordingViewState();
}

class _OnBordingViewState extends State<OnBordingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;

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
              CustomNavBar(
                onTap: () {
                  onBordingVisited();

                  customReplacementNavigate(context, '/signUp');
                },
              ),
              OnBordingWidgetBody(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: _controller,
              ),
              const SizedBox(
                height: 88,
              ),
              GetButtons(currentIndex: currentIndex, controller: _controller)
            ],
          ),
        ),
      ),
    );
  }
}
