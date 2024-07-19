import 'package:get/get.dart';
import 'package:greenus/modules/init/bindings/init_binding.dart';
import 'package:greenus/modules/init/pages/init_view.dart';
import 'package:greenus/modules/main/bindings/main_binding.dart';
import 'package:greenus/modules/main/pages/main_view.dart';
import 'package:greenus/modules/mission/bindings/mission_camera_binding.dart';
import 'package:greenus/modules/mission/bindings/mission_guide_binding.dart';
import 'package:greenus/modules/mission/bindings/mission_result_binding.dart';
import 'package:greenus/modules/mission/bindings/mission_upload_binding.dart';
import 'package:greenus/modules/mission/views/mission_camera_view.dart';
import 'package:greenus/modules/mission/views/mission_guide_view.dart';
import 'package:greenus/modules/mission/views/mission_result_view.dart';
import 'package:greenus/modules/mission/views/mission_upload_view.dart';
import 'package:greenus/modules/qna/pages/qna_view.dart';

import '../modules/qna/bindings/qna_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INIT;

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: Routes.INIT,
      binding: InitBinding(),
      page: () => const InitView(),
    ),
    GetPage(
      name: Routes.MAIN,
      binding: MainBinding(),
      page: () => const MainView(),
    ),
    GetPage(
      name: Routes.QNA,
      binding: QnaBinding(),
      page: () => const QnaView(),
    ),
    GetPage(
      name: Routes.MISSION_GUIDE,
      binding: MissionGuideBinding(),
      page: () => const MissionGuideView(),
    ),
    GetPage(
      name: Routes.MISSION_CAMERA,
      binding: MissionCameraBinding(),
      page: () => const MissionCameraView(),
    ),
    GetPage(
      name: Routes.MISSION_UPLOAD,
      binding: MissionUploadBinding(),
      page: () => const MissionUploadView(),
    ),
    GetPage(
      name: Routes.MISSION_RESULT,
      binding: MissionResultBinding(),
      page: () => const MissionResultView(),
    ),
  ];
}
