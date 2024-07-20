import 'dart:io';
import 'package:get/get.dart';
import 'package:greenus/routes/app_pages.dart';
import 'package:image/image.dart' as img;

import 'package:camera/camera.dart';
import 'package:greenus/core/base/base_controller.dart';
import 'package:path_provider/path_provider.dart';

class MissionCameraController extends BaseController {
  late final String title;
  late final CameraController cameraController;
  late final List<CameraDescription> _cameras;


  @override
  void onInit() async {
    super.onInit();
    title = Get.arguments['title'];
    List<CameraDescription> descriptions = await availableCameras();
    cameraController = CameraController(descriptions[0], ResolutionPreset.high);
    cameraController.initialize().then((_) {
      isBindingComplete = true;
      update();
    });


  }

  void takePhoto() async {
    XFile? rawImage = await cameraController.takePicture();

    final imageBytes = await rawImage.readAsBytes();
    final img.Image? decodedImage = img.decodeImage(imageBytes);
    if (decodedImage != null) {
      final jpegBytes = img.encodeJpg(decodedImage);
      final directory = await getApplicationDocumentsDirectory();
      final String fileDir = '${directory.path}/converted_image.jpg';
      final jpegFile = File(fileDir);
      await jpegFile.writeAsBytes(jpegBytes);

      Get.toNamed(Routes.MISSION_UPLOAD,
          arguments: {'mission': title, 'image_file': fileDir});
    }
  }

  @override
  void dispose() {
    cameraController.dispose();

    super.dispose();
  }
}
