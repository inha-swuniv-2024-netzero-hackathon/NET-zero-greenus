import 'package:flutter/material.dart';
import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/modules/home/components/app_bar.dart';
import 'package:greenus/modules/mission/controllers/mission_result_controller.dart';

class MissionResultView extends BaseView<MissionResultController> {
  const MissionResultView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return CustomAppBar(title: 'title');
  }

  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
