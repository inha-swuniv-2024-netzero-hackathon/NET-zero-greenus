import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greenus/core/values/app_colors.dart';
import 'package:greenus/core/values/app_text_styles.dart';
import 'package:greenus/core/values/asset_paths.dart';

import '../../../routes/app_pages.dart';

class MissionInfo extends StatelessWidget {
  final dynamic missionData;

  const MissionInfo({
    required this.missionData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: missionData['missions'].length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: _missionItem(missionData['missions'][index]),
        );
      },
    );
  }

  Widget _missionItem(dynamic missionItem) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.MISSION_GUIDE,
            arguments: {'title': missionItem['title']});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
            image: missionItem['imageUrl'] != null
                ? DecorationImage(
                    image: NetworkImage(
                      'http://' + missionItem['imageUrl'],
                    ),
                    fit: BoxFit.cover,
                  )
                : null,
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(15.0)),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.network(
                  missionItem['iconUrl'],
                  width: 40,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              missionItem['title'],
              style: AppTextStyles.med13Style.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
