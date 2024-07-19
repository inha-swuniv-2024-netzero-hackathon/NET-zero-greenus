import 'package:get/get.dart';
import 'package:greenus/modules/init/controllers/init_controller.dart';
import 'package:greenus/modules/request_chat/controllers/request_chat_controller.dart';

class RequestChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RequestChatController>(RequestChatController());
  }
}