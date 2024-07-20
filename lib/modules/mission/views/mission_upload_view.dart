import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/modules/home/components/app_bar.dart';
import 'package:greenus/modules/mission/controllers/mission_result_controller.dart';
import 'package:greenus/modules/mission/controllers/mission_upload_controller.dart';
import 'package:lottie/lottie.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/values/asset_paths.dart';

class MissionUploadView extends BaseView<MissionUploadController> {
  const MissionUploadView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return CustomAppBar(title: '');
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () {
              return uploadInProgressWidget();
            },
          ),
        ],
      ),
    );
  }

  Widget uploadInProgressWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: controller.isUploading.value
                    ? const CircularProgressIndicator(
                        strokeWidth: 7,
                        color: AppColors.defaultColor,
                      )
                    : Lottie.asset(AssetPath.uploadCompleteLottie,
                        repeat: false),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        controller.isUploading.value
            ? Column(
                children: [
                  Text('업로드 중',
                      style: AppTextStyles.semi20Style),
                  Text('잠시만 기다려주세요',
                      style: AppTextStyles.reg16Style),
                ],
              )
            : Text('업로드 완료!',
                style: AppTextStyles.semi20Style),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
