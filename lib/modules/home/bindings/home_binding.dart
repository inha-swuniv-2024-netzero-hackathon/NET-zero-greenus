import 'package:get/get.dart';
import 'package:greenus/modules/init/controllers/init_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RequestController>(RequestController());
  }
}