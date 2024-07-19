import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenus/core/components/hover_button.dart';
import 'package:greenus/core/values/app_text_styles.dart';
import 'package:greenus/routes/app_pages.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/asset_paths.dart';

class SavingInfo extends StatelessWidget {
  final bool isActivateSaving;
  final Function() connectSaving;

  const SavingInfo({
    super.key,
    required this.isActivateSaving,
    required this.connectSaving,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: isActivateSaving ? _savingRegistered() : _noneSaving(),
    );
  }

  Widget _noneSaving() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '등록된 녹색 적금이 없어요 🥲',
          style: AppTextStyles.semi14Style,
        ),
        SizedBox(height: 10.0),
        GestureDetector(
          onTap: connectSaving,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.defaultColor,
            ),
            child: Text(
              '적금 연동하기',
              style: AppTextStyles.semi14Style.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _savingRegistered() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AssetPath.dummy,
              width: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '그린적금',
                  style: AppTextStyles.reg12Style,
                ),
                Text(
                  '260,000',
                  style: AppTextStyles.semi18Style,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        interestRate(),
        const SizedBox(height: 20),
        _ad(),
      ],
    );
  }

  Widget _ad() {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.defaultColor.withOpacity(0.15),
      ),
    );
  }

  Widget interestRate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.defaultColor,
          ),
          child: Text(
            '연 1.6%',
            style: AppTextStyles.semi12Style.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        LinearPercentIndicator(
          lineHeight: 8.0,
          percent: 0.5,
          progressColor: AppColors.defaultColor,
          barRadius: const Radius.circular(15.0),
          animation: true,
        ),
      ],
    );
  }
}
