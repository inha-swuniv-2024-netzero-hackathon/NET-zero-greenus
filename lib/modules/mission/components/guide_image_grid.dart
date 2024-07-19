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
  AssetPath.dummy,
  AssetPath.dummy,
  AssetPath.dummy,
  AssetPath.dummy,
  AssetPath.dummy,
  AssetPath.dummy,
  AssetPath.dummy,
  AssetPath.dummy,
  AssetPath.dummy,
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

