import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:greenus/core/base/base_controller.dart';

import '../../../routes/app_pages.dart';

class InitController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      initialize();
    });
  }

  void initialize() {
    Get.offAllNamed(Routes.MAIN);
  }
}
