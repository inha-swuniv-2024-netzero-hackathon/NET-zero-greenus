import 'package:flutter/material.dart';
import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/modules/home/components/app_bar.dart';
import 'package:greenus/modules/mission/controllers/mission_result_controller.dart';
import 'package:greenus/modules/mission/controllers/mission_upload_controller.dart';

class MissionUploadView extends BaseView<MissionUploadController> {
  const MissionUploadView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return CustomAppBar(title: 'title');
  }

  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
