import 'package:get/get.dart';
import 'package:greenus/modules/init/controllers/init_controller.dart';

class RequestBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RequestController>(RequestController());
  }
}