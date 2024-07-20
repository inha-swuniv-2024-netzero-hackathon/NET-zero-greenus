import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/core/base/base_view_no_safe_area.dart';
import 'package:greenus/modules/home/components/app_bar.dart';
import 'package:greenus/modules/mission/controllers/mission_camera_controller.dart';

class MissionCameraView extends BaseViewNoSafeArea<MissionCameraController> {
  const MissionCameraView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return CustomAppBar(
      title: controller.title,
      isTransparent: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (context) {
          if (!controller.isBindingComplete) {
            return Container();
          }
          return !controller.cameraController.value.isInitialized
              ? Container()
              : Stack(
                children: [
                  Transform.scale(
                      alignment: Alignment.center,
                      scale: 1 /
                          (controller.cameraController.value.aspectRatio *
                                  Get.size.aspectRatio -
                              0.18),
                      // scale: 1,
                      child: CameraPreview(
                        controller.cameraController,
                      ),
                    ),
                  if (controller.cameraController.value.isInitialized)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          controller.takePhoto();
                        },
                        child: Container(
                          height: 70,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                    ],
                  ),
                ],
              );
        });
  }
}
