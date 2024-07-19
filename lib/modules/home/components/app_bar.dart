import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';


class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final Widget? titleWidget;
  final IconData? leadingIcon;
  final double leadingIconSize;
  final Widget? leadingWidget;
  final double leadingWidth;
  final VoidCallback? onLeadingPressed;
  final List<Widget>? actions;
  final bool isTransparent;
  final Widget? flexibleSpace;
  final PreferredSize? bottom;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleWidget,
    this.leadingIcon = Icons.arrow_back_ios_new_rounded,
    this.leadingIconSize = 23,
    this.leadingWidget,
    this.leadingWidth = 80,
    this.onLeadingPressed,
    this.actions,
    this.isTransparent = true,
    this.flexibleSpace,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          isTransparent ? AppColors.transparent : AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: Transform.translate(
        offset:
            leadingWidget != null ? const Offset(20, 0) : const Offset(-20, 0),
        child: IconButton(
          highlightColor: AppColors.transparent,
          onPressed: () {
            if (onLeadingPressed != null) {
              onLeadingPressed!();
            } else {
              Get.back();
            }
          },
          icon: leadingWidget != null
              ? leadingWidget!
              : Icon(leadingIcon,
                  color: AppColors.linePrimary, size: leadingIconSize),
        ),
      ),
      leadingWidth: leadingWidth,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != '')
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.semi20Style,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          Flexible(child: titleWidget ?? const SizedBox()),
        ],
      ),
      flexibleSpace: flexibleSpace,
      centerTitle: true,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget get child => bottom ?? Container();
}

class SmitzBackAppBar extends StatelessWidget implements PreferredSize {
  final String leadingText;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final bool isTransparent;

  const SmitzBackAppBar(
      {super.key,
      required this.leadingText,
      this.leadingIcon,
      this.onLeadingPressed,
      required this.isTransparent});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          isTransparent ? AppColors.transparent : AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: Transform.translate(
        offset: const Offset(8, 0),
        child: IconButton(
          padding: EdgeInsets.zero,
          highlightColor: AppColors.transparent,
          onPressed: () {
            if (onLeadingPressed != null) {
              onLeadingPressed!();
            } else {

              Get.back();
            }
          },
          icon: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(leadingIcon ?? Icons.arrow_back_ios_new_rounded,
                  color: AppColors.linePrimary, size: 22),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  leadingText,
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.semi22Style,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
      leadingWidth: 150,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget get child => Container();
}
