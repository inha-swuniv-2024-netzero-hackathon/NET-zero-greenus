import 'package:get/get.dart';
import 'package:greenus/core/base/base_controller.dart';

class MissionResultController extends BaseController {

  late bool isSuccess;
  late String message;

  @override
  void onInit() {
    isSuccess = Get.arguments['is_success'];
    message = Get.arguments['message'];

    super.onInit();
  }

}
