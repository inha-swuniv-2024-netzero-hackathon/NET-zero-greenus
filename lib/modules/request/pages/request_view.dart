import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/modules/init/controllers/init_controller.dart';

import '../../../routes/app_pages.dart';

class RequestView extends BaseView<RequestController> {
  const RequestView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('request'),
          TextButton(onPressed: () {
            Get.toNamed(Routes.REQUEST_CHAT);

          }, child: Text('button')),
        ],
      ),
    );
  }
}
