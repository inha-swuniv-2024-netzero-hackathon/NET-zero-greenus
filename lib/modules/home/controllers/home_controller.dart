import 'dart:convert';

import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:greenus/core/base/base_controller.dart';
import 'package:greenus/modules/home/components/alert_dialog/alert_dialog.dart';
import 'package:greenus/modules/home/components/alert_dialog/alert_option.dart';
import 'package:http/http.dart' as http;

class HomeController extends BaseController {
  bool isActivateSaving = false;
  dynamic savingsData;
  dynamic missionData;

  bool isDataLoaded = false;

  @override
  void onInit() async {
    super.onInit();

    Future.wait([
      getSavings(),
      getMissions(),
    ]).then((_) {
      isBindingComplete = true;
      update();
    });
  }

  void connectSaving() async {
    var url = Uri.parse('http://43.203.144.204:8080/users/1/savings');
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "bank": "그린은행",
      "savingsName": "그린적금",
      "interestRate": 1.8,
      "balance": 100000,
    });

    var response = await http.post(url, headers: headers, body: body);

    print(response.statusCode);
    if (response.statusCode == 201) {
      await getSavings();
      Get.dialog(
        CustomAlertDialog(AlertOption(
            title: '적금이 연동되었어요!', content: null, isShowCancelPressed: false)),
      );
      isActivateSaving = true;
      update();
    }
  }

  Future<void> getSavings() async {
    var url = Uri.parse('http://43.203.144.204:8080/users/1/savings');
    var response = await http.get(url);
    var data = json.decode(utf8.decode(response.bodyBytes));
    savingsData = data;
    print(savingsData);
  }

  Future<void> getMissions() async {
    var url = Uri.parse('http://43.203.144.204:8080/users/1/missions');
    var response = await http.get(url);
    var data = json.decode(utf8.decode(response.bodyBytes));
    missionData = data;
    print(missionData);
  }

  void onRefresh() async {
    await getMissions();
    update();
  }
}
