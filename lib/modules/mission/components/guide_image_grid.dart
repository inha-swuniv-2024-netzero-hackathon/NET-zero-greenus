import 'package:flutter/material.dart';
import 'package:greenus/core/values/asset_paths.dart';
import 'package:photo_manager/photo_manager.dart';

import 'guide_image_item.dart';

List<String> guideImageInfoTexts = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];

const List<bool> guideImageInfoIsPositive = [
  true,
  true,
  true,
  true,
  true,
  true,
  false,
  false,
  false,
];

const List<String> guideImageList = [
  'assets/icons/correct_1.png',
  'assets/icons/correct_2.jpg',
  'assets/icons/correct_3.jpg',
  'assets/icons/correct_4.jpg',
  'assets/icons/correct_1.png',
  'assets/icons/correct_2.jpg',
  'assets/icons/correct_1.png',
  'assets/icons/correct_2.jpg',
  'assets/icons/correct_3.jpg',
];

class GuideImageGrid extends StatelessWidget {
  const GuideImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: List.generate(
          3,
          (index) => Row(
            children: List.generate(
              3,
              (mIndex) => Expanded(
                child: GuideImageItem(
                  guideImageInfo: GuideImageItemModel(
                    text: guideImageInfoTexts[3 * mIndex + index],
                    isPositive: guideImageInfoIsPositive[3 * mIndex + index],
                    imagePath: guideImageList[3 * mIndex + index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GuideImageItemModel {
  final String text;
  final String imagePath;
  final bool isPositive;

  GuideImageItemModel(
      {required this.text, required this.imagePath, required this.isPositive});
}

class ConfirmImageInfoOnboarding {
  final AssetEntity selectedImage;
  final bool isPositive;

  ConfirmImageInfoOnboarding(
      {required this.selectedImage, required this.isPositive});
}
