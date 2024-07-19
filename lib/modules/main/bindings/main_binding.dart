import 'package:get/get.dart';
import 'package:greenus/modules/main/controllers/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}