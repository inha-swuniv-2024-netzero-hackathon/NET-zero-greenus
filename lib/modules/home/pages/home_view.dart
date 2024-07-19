import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/core/values/app_text_styles.dart';
import 'package:greenus/core/values/asset_paths.dart';
import 'package:greenus/modules/home/components/app_bar.dart';
import 'package:greenus/modules/home/components/mission_info.dart';
import 'package:greenus/modules/home/components/saving_info.dart';
import 'package:greenus/modules/home/controllers/home_controller.dart';
import 'package:greenus/routes/app_pages.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return CustomAppBar(
      title: '',
      leadingWidget: Image.asset(AssetPath.dummy),
      actions: [
        IconButton(
            onPressed: () {
              Get.toNamed(Routes.QNA);
            },
            icon: Icon(Icons.chat)),
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (context) {
          return SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                _title('나의 적금'),
                SavingInfo(
                  isActivateSaving: controller.isActivateSaving,
                  connectSaving: controller.connectSaving,
                ),
                const SizedBox(height: 15.0),
                _title('나의 미션'),
                MissionInfo(),
              ],
            ),
          );
        });
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
      child: Text(
        title,
        style: AppTextStyles.bold18Style,
      ),
    );
  }
}
