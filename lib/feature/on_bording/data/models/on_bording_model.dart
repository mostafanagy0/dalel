import 'package:dalel/core/utils/app_assets.dart';

class OnBordingModel {
  final String imagePath;
  final String titel;
  final String subTitel;

  OnBordingModel({
    required this.imagePath,
    required this.titel,
    required this.subTitel,
  });
}

List<OnBordingModel> onbordingData = [
  OnBordingModel(
    imagePath: Assets.assetsImagesOnBoarding1,
    titel: "Explore The history with Dalel in a smart way",
    subTitel:
        "Using our app’s history libraries you can find many historical periods ",
  ),
  OnBordingModel(
    imagePath: Assets.assetsImagesOnBoarding2,
    titel: "From every place on earth",
    subTitel: "A big variety of ancient places from all over the world",
  ),
  OnBordingModel(
    imagePath: Assets.assetsImagesOnBoarding,
    titel: "Using modern AI technology for better user experience",
    subTitel:
        "AI provide recommendations and helps you to continue the search journey",
  ),
];
