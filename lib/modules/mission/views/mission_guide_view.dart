import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/core/values/app_text_styles.dart';
import 'package:greenus/modules/home/components/app_bar.dart';
import 'package:greenus/modules/home/components/bottom_confirm.dart';
import 'package:greenus/modules/mission/controllers/mission_guide_controller.dart';
import 'package:greenus/routes/app_pages.dart';

import '../components/guide_image_grid.dart';

class MissionGuideView extends BaseView<MissionGuideController> {
  const MissionGuideView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return CustomAppBar(title: controller.title);
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '잠깐!',
                style: AppTextStyles.semi22Style,
              ),
              SizedBox(height: 5),
              Text(
                '- 촬영하기에 앞서 가이드를 참고해주세요',
                style: AppTextStyles.reg14Style,
              ),
              Text(
                '- 가이드를 따르지 않을 경우 인증에 실패할 수 있어요',
                style: AppTextStyles.reg14Style,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: const GuideImageGrid(),
              ),
            ],
          ),
        ),
        Positioned(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BottomConfirmWidget(
              condition: true,
              text: '촬영하기',
              onTap: () {
                Get.toNamed(Routes.MISSION_CAMERA, arguments: {
                  'title': controller.title,
                });
              },
            ),
          ],
        )),
      ],
    );
  }
}
