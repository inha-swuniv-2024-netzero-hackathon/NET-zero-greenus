import 'package:get/get.dart';
import 'package:greenus/modules/mission/controllers/mission_camera_controller.dart';
import 'package:greenus/modules/mission/controllers/mission_guide_controller.dart';

class MissionGuideBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MissionGuideController>(MissionGuideController());
  }}
