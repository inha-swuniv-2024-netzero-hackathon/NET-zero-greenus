import 'package:get/get.dart';
import 'package:greenus/modules/mission/controllers/mission_result_controller.dart';

class MissionResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MissionResultController>(MissionResultController());
  }}
