import 'package:flutter/cupertino.dart';
import 'package:greenus/core/values/app_colors.dart';
import 'package:greenus/core/values/app_text_styles.dart';
import 'package:greenus/core/values/asset_paths.dart';

class MissionInfo extends StatelessWidget {
  const MissionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: _missionItem(),
        );
      },
    );
  }

  Widget _missionItem() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: AppColors.darkGrey, borderRadius: BorderRadius.circular(15.0)),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                AssetPath.dummy,
                width: 40,
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '쓰레기 줍기',
            style: AppTextStyles.med13Style.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
