import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class BaseController extends FullLifeCycleController {
  late final ScrollController scrollController = ScrollController();

  bool isBindingComplete = false;

  @mustCallSuper
  void bindItem() {
    isBindingComplete = true;
    update();
  }

  @mustCallSuper
  void unbindItem() {
    isBindingComplete = false;
    update();
  }

  showErrorDialog({dynamic exception}) {
    // logger.e(exception);
    Get.back(closeOverlays: true);
    // Get.dialog(
    //   SmitzAlertDialog(
    //     AlertOption(
    //         title: S.current.errorOccurred,
    //         content: S.current.retryLater,
    //         isShowCancelPressed: false),
    //   ),
    // );
  }
}
