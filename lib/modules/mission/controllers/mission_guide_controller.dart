import 'package:get/get.dart';
import 'package:greenus/core/base/base_controller.dart';

class MissionGuideController extends BaseController {
  late final String title;

  @override
  void onInit() {
    super.onInit();
    title = Get.arguments['title'];
  }
}
