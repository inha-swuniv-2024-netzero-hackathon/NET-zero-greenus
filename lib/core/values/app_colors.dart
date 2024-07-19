import 'package:flutter/painting.dart';

abstract class AppColors {
  static const Color defaultColor = Color(0xff2f4bf5);
  static const Color darkLine = Color(0xff49454F);
  static const Color transparent = Color(0x00000000);

  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff131619);
  static const Color blackNeutral = Color(0xff272727);
  static const Color blackBackground = Color(0xff0D0D0D);
  static const Color blackDim = Color(0x66131619);
  static const Color blackLight = Color(0xff1A1A1A);
  // static const Color blackLightBox = Color(0xff212121);
  static const Color blackLightBox = Color(0xff1A1A1A);
  static const Color blackLightHover = Color(0xff272727);
  static const Color blackZero = Color(0xff000000);

  static const Color charcoal = Color(0xff454F5D);
  static const Color darkGrey = Color(0xff5C6370);
  // static const Color midGrey = Color(0xff8D94A0);
  static const Color grey = Color(0xffcbcbcb);
  static const Color midGrey = Color(0xff6c6c6c);
  static const Color placeHolder = Color(0xffB0BAC8);
  static const Color backgroundLight = Color(0xffFAFBFC);
  static const Color lineDarkmode = Color(0xff242B35);
  static const Color linePrimary = Color(0xffE6EAED);
  static const Color darkModeWhite = Color(0xfffafafa);
  static const Color backgroundBehance = Color(0xffFBFBFB);
  static const Color background = Color(0xfff2f4f6);
  static const Color bannerDecoration = Color(0xff90896C);
  static const Color popularDecoration = Color(0xff473F41);

  static const Color primary100 = Color(0xffE8E9FF);
  static const Color primary200 = Color(0xffCACCFE);
  static const Color primary300 = Color(0xff7B81FF);
  static const Color primary400 = Color(0xff7B81FF);
  static const Color primary1000 = defaultColor;
  static const Color primaryHover = Color(0xff0911C1);

  static const Color info5 = Color(0x0d3A42FB);
  static const Color info10 = Color(0x1a3A42FB);
  static const Color info20 = Color(0x333A42FB);
  static const Color info30 = Color(0x4d903afb);

  static const Color etcErrorRed = Color(0xffFC0D1B);
  static const Color etcKakao = Color(0xffFFE812);
  static const Color opposition = Color(0xffD83250);

  static const Color bannerDim = Color(0xff242830);

  static const Color kakaoContainer = Color(0xfffee500);
  static Color kakaoText = const Color(0xff000000).withOpacity(0.85);
  static const Color kakaoSymbol = Color(0xff000000);

  static const Color appleContainer = Color(0xffffffff);
  static const Color appleText = Color(0xff000000);
  static const Color appleSymbol = Color(0xff000000);

  static const Color shimmerBaseColor = AppColors.black;
  static const Color shimmerHighlightColor = AppColors.darkGrey;

  static const Color basilePackBg = Color(0xffFF41D5);

  /// filter color
  static const Color baslieFilter = Color(0xFFFF33C8);
  static const Color kPopFilter = Color(0xFF56D6FF);
  static const Color profileFilter = Color(0xFF9C94FF);
  static const Color weddingFilter = Color(0xFF524115);
  static const Color schoolFilter = Color(0xFFA1E9FF);

  static const Color frameBgBlack = Color(0xFF131619);
  static const Color frameBgBlue = Color(0xFF3A42FB);
  static const Color frameBgRed = Color(0xFFD83250);
  static const Color frameBgWhite = Color(0xFFFFFFFF);
}

abstract class SmitzLinearGradient {
  static const LinearGradient mainGradientColor = LinearGradient(
    colors: [
      Color(0xff3486F3),
      Color(0xFF6B4BED),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient mainPlaceHolderGradient = LinearGradient(
    colors: [
      AppColors.darkGrey.withOpacity(0.2),
      AppColors.darkGrey.withOpacity(0.1),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );



  static const LinearGradient goldGradientColor = LinearGradient(
    colors: [
      Color(0xffAB6F14),
      Color(0xffDA9E3C),
      Color(0xFF805D03),
    ],
    stops: [0.0, 0.65, 1.0],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );


  static const LinearGradient bottomDim = LinearGradient(
      colors: [AppColors.transparent, AppColors.blackZero],
      stops: [0.0, 0.7],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const LinearGradient libraryBottomDim = LinearGradient(
      colors: [AppColors.transparent, AppColors.blackBackground],
      stops: [0.0, 0.9],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const LinearGradient appbarDim = LinearGradient(
      colors: [AppColors.transparent, AppColors.black],
      stops: [0.0, 0.7],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);

  static const LinearGradient landingBottomDim = LinearGradient(colors: [
    AppColors.transparent,
    AppColors.blackZero,
    AppColors.blackZero
  ], stops: [
    0.0,
    0.8,
    1
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient introductionPageDim = LinearGradient(colors: [
    AppColors.blackZero,
    AppColors.transparent,
    AppColors.transparent,
    AppColors.blackZero,
    AppColors.blackZero
  ], stops: [
    0.0,
    0.2,
    0.7,
    0.85,
    1
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient mainTopBannerDim = LinearGradient(colors: [
    AppColors.bannerDim,
    AppColors.bannerDim,
    AppColors.transparent
  ], stops: [
    0.0,
    0.45,
    1
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static const LinearGradient serviceDetailedPageDim = LinearGradient(colors: [
    AppColors.blackZero,
    AppColors.transparent,
    AppColors.blackZero
  ], stops: [
    0.0,
    0.5,
    1
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient videoPageDim = LinearGradient(
    stops: [0, 1],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.transparent,
      AppColors.black,
    ],
  );

  static const LinearGradient premiumDim = LinearGradient(
    colors: [
      AppColors.lineDarkmode,
      AppColors.lineDarkmode,
      AppColors.transparent
    ],
    stops: [0, 0.45, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
