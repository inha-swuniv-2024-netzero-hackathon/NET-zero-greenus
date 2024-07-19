import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:greenus/core/base/base_controller.dart';
import 'package:greenus/modules/home/components/alert_dialog/alert_dialog.dart';
import 'package:greenus/modules/home/components/alert_dialog/alert_option.dart';

import '../../../routes/app_pages.dart';

class HomeController extends BaseController {
  bool isActivateSaving = false;

  @override
  void onInit() {
    super.onInit();
  }

  void connectSaving() {
    Get.dialog(
      CustomAlertDialog(AlertOption(
          title: '적금이 연동되었어요!', content: null, isShowCancelPressed: false)),
    );
    isActivateSaving = true;
    update();
  }
}
