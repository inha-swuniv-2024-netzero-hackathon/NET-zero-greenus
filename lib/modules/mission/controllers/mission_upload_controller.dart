import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:greenus/core/base/base_controller.dart';
import 'package:greenus/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

import '../../home/controllers/home_controller.dart';

class MissionUploadController extends BaseController {
  /// upload-ing flag
  RxBool isUploading = RxBool(true);

  /// profile upload progress
  RxInt progress = RxInt(0);

  late final String mission;
  late final String imageFile;

  @override
  void onInit() {
    super.onInit();
    mission = Get.arguments['mission'];
    imageFile = Get.arguments['image_file'];
    uploadS3();
  }

  void uploadS3() async {
    var file = File(imageFile);
    String mediaType = lookupMimeType(file.path) ?? 'image/jpg';

    MultipartRequest request = http.MultipartRequest(
        'POST', Uri.parse('http://43.203.144.204:8080/certification'));

    request.fields['userId'] = '1';
    request.fields['category'] = mission;
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'file',
      file.path,
      filename: basename(file.path),
      contentType: MediaType.parse(mediaType),
    );

    request.files.add(multipartFile);

    var response = await request.send();

    var data = json.decode(utf8.decode(await response.stream.toBytes()));

    isUploading(false);

    Future.delayed(const Duration(seconds: 3)).then((_) {
      Get.find<HomeController>().onRefresh();
      Get.toNamed(Routes.MISSION_RESULT, arguments: {
        'message': response.statusCode == 200 ? data['message'] : data['suggestion'],
        'is_success' : response.statusCode == 200,
      });
    });
  }


}
