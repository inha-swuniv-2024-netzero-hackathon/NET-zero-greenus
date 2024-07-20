import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/core/values/app_text_styles.dart';
import 'package:greenus/core/values/asset_paths.dart';
import 'package:greenus/modules/home/components/app_bar.dart';
import 'package:greenus/modules/home/components/bottom_confirm.dart';
import 'package:greenus/modules/mission/controllers/mission_result_controller.dart';

import '../../../routes/app_pages.dart';

class MissionResultView extends BaseView<MissionResultController> {
  const MissionResultView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return CustomAppBar(title: '');
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.isSuccess
                  ? Image.asset(
                      AssetPath.success,
                      width: 150,
                    )
                  : Image.asset(AssetPath.fail, width: 150),
              const SizedBox(height: 10),
              Text(
                controller.isSuccess ? '미션에 성공하셨어요!' : '미션 인증에 실패하였어요',
                style: AppTextStyles.semi16Style,
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: BottomConfirmWidget(
              condition: true,
              text: '확인',
              onTap: () {
                Get.toNamed(Routes.MAIN);
              }),
        )
      ],
    );
  }
}
