import 'package:get/get.dart';
import 'package:greenus/modules/mission/controllers/mission_upload_controller.dart';

class MissionUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MissionUploadController>(MissionUploadController());
  }
}
