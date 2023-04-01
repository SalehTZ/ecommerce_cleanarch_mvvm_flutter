import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app_using_mvvm/presentation/resources/assets_manager.dart';
import 'package:shop_app_using_mvvm/presentation/resources/color_manager.dart';
import 'package:shop_app_using_mvvm/presentation/resources/strings_manager.dart';
import 'package:shop_app_using_mvvm/presentation/resources/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../resources/routes_manager.dart';

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
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
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
          return OnBoardingPage(_sliderList[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        // height: AppSize.s100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: IconButton(
              icon: _currentIndex != 0
                  ? const Icon(Icons.chevron_left_rounded)
                  : const Text(''),
              constraints:
                  BoxConstraints.tight(const Size(AppSize.s60, AppSize.s20)),
              padding: const EdgeInsets.all(0),
              onPressed: () {
                if (_currentIndex != 0) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: AppDuration.dms300),
                    curve: Curves.ease,
                  );
                }
              },
            ),
          ),

          //! circle indicators
          SmoothPageIndicator(
            controller: _pageController,
            count: 4,
            effect: JumpingDotEffect(
              activeDotColor: _currentIndex == 0
                  ? ColorManager.pink
                  : _currentIndex == 1
                      ? ColorManager.lightBlue
                      : _currentIndex == 2
                          ? ColorManager.yellow
                          : ColorManager.purple,
              dotColor: ColorManager.grey,
            ),
          ),

          //! right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: IconButton(
              icon: _currentIndex != 3
                  ? const Icon(Icons.chevron_right_rounded)
                  : const Icon(Icons.done),
              constraints:
                  BoxConstraints.tight(const Size(AppSize.s60, AppSize.s20)),
              padding: const EdgeInsets.all(0),
              onPressed: () {
                if (_currentIndex != 3) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: AppDuration.dms300),
                    curve: Curves.ease,
                  );
                } else {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final Sliders _sliders;

  const OnBoardingPage(this._sliders, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliders.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliders.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliders.image),
      ],
    );
  }
}

class Sliders {
  String title, subTitle, image;
  Sliders(this.title, this.subTitle, this.image);
}
