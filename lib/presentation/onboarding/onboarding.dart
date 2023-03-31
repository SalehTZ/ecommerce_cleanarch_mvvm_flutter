import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app_using_mvvm/presentation/resources/assets_manager.dart';
import 'package:shop_app_using_mvvm/presentation/resources/color_manager.dart';
import 'package:shop_app_using_mvvm/presentation/resources/strings_manager.dart';
import 'package:shop_app_using_mvvm/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<Sliders> _sliderList = _getSliderData();

  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<Sliders> _getSliderData() => [
        Sliders(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1,
            AppImageAssets.onBoardingLogo1),
        Sliders(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2,
            AppImageAssets.onBoardingLogo2),
        Sliders(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3,
            AppImageAssets.onBoardingLogo3),
        Sliders(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4,
            AppImageAssets.onBoardingLogo4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _sliderList.length,
        onPageChanged: (newIndex) {
          setState(() => _currentIndex = newIndex);
        },
        itemBuilder: (context, index) {
          // return onboardingPage;
        },
      ),
    );
  }
}

class Sliders {
  String title, subTitle, image;
  Sliders(this.title, this.subTitle, this.image);
}
