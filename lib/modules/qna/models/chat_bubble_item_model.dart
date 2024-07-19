import 'dart:ui';

import 'package:flutter/foundation.dart';

class ChatBubbleItemModel {
  final bool isMe;
  final String message;
  final String? backgroundImageUrl;
  final List<OptionContentModel>? optionContentList;
  final List<OptionImageModel>? optionImageList;

  ChatBubbleItemModel({
    required this.isMe,
    required this.message,
    this.backgroundImageUrl,
    this.optionContentList,
    this.optionImageList,
  });
}

class OptionContentModel {
  final String content;
  final VoidCallback? onTap;

  OptionContentModel({
    required this.content,
    this.onTap,
  });
}

class OptionImageModel {
  final String? backgroundUrl;
  final String? iconUrl;
  final Color? backgroundColor;

  OptionImageModel({
    required this.backgroundUrl,
    required this.iconUrl,
    required this.backgroundColor,
  });
}
