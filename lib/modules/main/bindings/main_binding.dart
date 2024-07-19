import 'package:get/get.dart';
import 'package:greenus/modules/main/controllers/main_controller.dart';
import 'package:greenus/modules/qna/controllers/qna_controller.dart';

import '../../home/controllers/home_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<HomeController>(HomeController());
    Get.put<QnaController>(QnaController());
  }
}