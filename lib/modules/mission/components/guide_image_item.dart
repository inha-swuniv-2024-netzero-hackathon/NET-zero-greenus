import 'package:flutter/material.dart';
import 'package:greenus/core/values/app_text_styles.dart';

import '../../../core/values/app_colors.dart';
import 'guide_image_grid.dart';

class GuideImageItem extends StatelessWidget {
  final GuideImageItemModel guideImageInfo;
  const GuideImageItem({super.key, required this.guideImageInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: guideImageInfo.isPositive
                              ? AppColors.primaryHover
                              : AppColors.opposition,
                          width: 2),
                      image: DecorationImage(
                          image: AssetImage(guideImageInfo.imagePath),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 5,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: guideImageInfo.isPositive
                        ? AppColors.primaryHover
                        : AppColors.opposition,
                    child: Icon(
                      guideImageInfo.isPositive
                          ? Icons.check_rounded
                          : Icons.close_rounded,
                      size: 15,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 1,
            child: Text(
              guideImageInfo.text,
              style: AppTextStyles.reg12Style,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
