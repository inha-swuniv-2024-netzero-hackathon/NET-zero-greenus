import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/modules/home/components/app_bar.dart';
import 'package:greenus/modules/mission/controllers/mission_camera_controller.dart';

class MissionCameraView extends BaseView<MissionCameraController> {
  const MissionCameraView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return CustomAppBar(title: 'title');
  }

  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
