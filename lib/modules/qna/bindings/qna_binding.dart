import 'package:get/get.dart';

import '../controllers/qna_controller.dart';

class QnaBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<QnaController>(QnaController());
  }
}