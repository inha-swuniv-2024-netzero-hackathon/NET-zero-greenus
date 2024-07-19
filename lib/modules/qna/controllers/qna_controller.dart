import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenus/core/base/base_controller.dart';

import '../../../core/values/asset_paths.dart';
import '../models/chat_bubble_item_model.dart';

class QnaController extends BaseController {
  ScrollController scrollController = ScrollController();
  RxList<ChatBubbleItemModel> chatBubbleItemList = RxList.empty();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  List<bool> activateStateList = [];

  final lensColorList = [
    (color: Colors.brown, name: '갈색'),
    (color: Colors.lightGreen, name: '밝은 갈색'),
    (color: Colors.deepPurple, name: '네이비')
  ];

  final clothingColorList = [
    (color: Colors.white, name: '화이트'),
    (color: Colors.black, name: '블랙'),
    (color: Colors.indigoAccent, name: '네이비'),
    (color: Colors.pink, name: '핑크')
  ];

  CustomOptionType currentOptionType = CustomOptionType.start;
  ChatBubbleItemModel? currentChatBubble;

  bool endOfProcess = false;

  late final ChatBubbleItemModel backgroundOptionItem;
  late final ChatBubbleItemModel hairOptionItem;
  late final ChatBubbleItemModel clothingOptionItem;
  late final ChatBubbleItemModel emailOptionItem;
  late final ChatBubbleItemModel conceptOptionItem;

  bool isShowOption = false;

  bool isChatEmpty = true;

  bool isActivateChat = false;

  List<String> optionList = [];

  final TextEditingController textEditingController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  @override
  void onInit() async {
    _setOption();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appendStartOptions();
    });
    super.onInit();
  }

  void deActivateState(int index) {
    activateStateList[index] = false;
  }

  /// 일정 Duration을 두어 chat bubble을 삽입한다.
  appendChatBubble(ChatBubbleItemModel chatBubbleItem,
      {tryNext = false}) async {
    activateStateList.add(true);
    await Future.delayed(const Duration(milliseconds: 200), () {
      chatBubbleItemList.add(chatBubbleItem);
      if (chatBubbleItem.optionContentList != null &&
          chatBubbleItem.optionContentList!.isNotEmpty) {
        changeOptionList(
            chatBubbleItem.optionContentList!.map((e) => e.content).toList());
      }
      listKey.currentState?.insertItem(chatBubbleItemList.length - 1);
      Future.delayed(const Duration(milliseconds: 300), () {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      });
    });
    if (tryNext) {
      nextOption();
    }
  }

  _setOption() {
    hairOptionItem = ChatBubbleItemModel(
      isMe: false,
      message: '옵션을 선택하세요',
      backgroundImageUrl: AssetPath.genderOptionBg,
      optionContentList: [
        OptionContentModel(content: '옵션'),
        OptionContentModel(content: '옵션'),
        OptionContentModel(content: '옵션'),
        OptionContentModel(content: '옵션'),
      ],
      optionImageList: [
        OptionImageModel(
            backgroundUrl: null,
            iconUrl: 'assets/icons/option_dummy.png',
            backgroundColor: const Color(0xFFA11E43)),
        OptionImageModel(
            backgroundUrl: null,
            iconUrl: 'assets/icons/option_dummy.png',
            backgroundColor: const Color(0xFFB78D4C)),
        OptionImageModel(
            backgroundUrl: null,
            iconUrl: 'assets/icons/option_dummy.png',
            backgroundColor: const Color(0xFF24539D)),
        OptionImageModel(
            backgroundUrl: null,
            iconUrl: 'assets/icons/option_dummy.png',
            backgroundColor: const Color(0xFFA11E43)),
      ],
    );

    clothingOptionItem = ChatBubbleItemModel(
      isMe: false,
      message: '옵션을 선택하세요',
      backgroundImageUrl: AssetPath.lensOptionBg,
      optionContentList: [
        OptionContentModel(content: '옵션'),
        OptionContentModel(content: '옵션'),
        OptionContentModel(content: '옵션'),
        OptionContentModel(content: '옵션'),
      ],
      optionImageList: [
        OptionImageModel(
            backgroundUrl: null,
            iconUrl: 'assets/icons/option_dummy.png',
            backgroundColor: const Color(0xFF436A9F)),
        OptionImageModel(
            backgroundUrl: null,
            iconUrl: 'assets/icons/option_dummy.png',
            backgroundColor: const Color(0xFFB78D4C)),
        OptionImageModel(
            backgroundUrl: null,
            iconUrl: 'assets/icons/option_dummy.png',
            backgroundColor: const Color(0xFF18839D)),
        OptionImageModel(
            backgroundUrl: null,
            iconUrl: 'assets/icons/option_dummy.png',
            backgroundColor: const Color(0xFFA11E43)),
      ],
    );
    backgroundOptionItem = ChatBubbleItemModel(
      isMe: false,
      message: '옵션을 선택하세요',
      backgroundImageUrl: AssetPath.backdropOptionBg,
      optionContentList: [
        OptionContentModel(content: '옵션'),
        OptionContentModel(content: '옵션'),
        OptionContentModel(content: '옵션'),
      ],
      optionImageList: [
        OptionImageModel(
            backgroundUrl: 'assets/icons/option_dummy.png',
            iconUrl: null,
            backgroundColor: null),
        OptionImageModel(
            backgroundUrl: 'assets/icons/option_dummy.png',
            iconUrl: null,
            backgroundColor: null),
        OptionImageModel(
            backgroundUrl: 'assets/icons/option_dummy.png',
            iconUrl: null,
            backgroundColor: null),
      ],
    );

    emailOptionItem = ChatBubbleItemModel(isMe: false, message: '종료');

    conceptOptionItem = ChatBubbleItemModel(isMe: false, message: '종료');
  }

  nextOption() {
    if (currentOptionType.index == CustomOptionType.values.length - 1) {
      isActivateChat = false;
      appendChatBubble(
          ChatBubbleItemModel(isMe: false, message: '제작해서 알려드릴게요'));
      endOfProcess = true;
      update();
      return;
    }
    currentOptionType = CustomOptionType.values[currentOptionType.index + 1];
    update();

    switch (currentOptionType) {
      case CustomOptionType.background:
        return appendChatBubble(backgroundOptionItem);
      case CustomOptionType.clothing:
        return appendChatBubble(clothingOptionItem);
      case CustomOptionType.hair:
        return appendChatBubble(hairOptionItem);
        // case CustomOptionType.email:
        //   isActivateChat = true;
        return appendChatBubble(emailOptionItem);
      // case CustomOptionType.concept:
      //   isActivateChat = true;
      //   return appendChatBubble(conceptOptionItem);
      default:
        break;
    }
  }

  appendStartOptions() async {
    await appendChatBubble(
        ChatBubbleItemModel(isMe: false, message: '안녕하세요 AI 그리너스 비서 그린이 입니다.'));
    await appendChatBubble(
      ChatBubbleItemModel(
        isMe: false,
        message: '적금 관련 궁금한 사항과 환경 관련 트렌드 등에 관해 질문해보세요!',
        // optionContentList: [
        //   OptionContentModel(
        //     content: 'A',
        //   ),
        //   OptionContentModel(
        //     content: 'B',
        //   ),
        // ],
      ),
    );
    isShowOption = true;
    update();
  }

  changeOptionList(List<String> newOptionList) {
    optionList.clear();
    optionList.addAll(newOptionList);
    isShowOption = true;
    update();
  }

  void onChangedChat(String? value) {
    isChatEmpty = (value == null || value.isEmpty);
    update();
  }

  /// 옵션을 선택한다
  void choiceOption(String text) async {
    isShowOption = false;
    update();
    await appendChatBubble(ChatBubbleItemModel(isMe: true, message: text));
    nextOption();
  }

  void submitChat(String value) {
    appendChatBubble(ChatBubbleItemModel(isMe: true, message: value));
    appendChatBubble(ChatBubbleItemModel(isMe: false, message: '대답'));
    textEditingController.clear();
    isChatEmpty = true;

    // if (currentOptionType == CustomOptionType.email) {
    //   if (_validateEmail(value)) {
    //     appendChatBubble(ChatBubbleItemModel(isMe: true, message: value),
    //         tryNext: true);
    //   } else {
    //     appendChatBubble(ChatBubbleItemModel(isMe: true, message: value));
    //     appendChatBubble(
    //         ChatBubbleItemModel(isMe: false, message: '잘못된 이메일 형식'));
    //   }
    //   textEditingController.clear();
    // } else {
    //   appendChatBubble(ChatBubbleItemModel(isMe: true, message: value),
    //       tryNext: true);
    //   textEditingController.clear();
    // }
    focusNode.unfocus();
    update();
  }

  bool _validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && regex.hasMatch(value);
  }
}

enum CustomOptionType {
  start,
  hair,
  clothing,
  background,
  email,
  concept,
}
