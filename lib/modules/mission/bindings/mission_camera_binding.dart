import 'package:get/get.dart';
import 'package:greenus/modules/mission/controllers/mission_camera_controller.dart';

class MissionCameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MissionCameraController>(MissionCameraController());
  }}
