import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        backgroundColor: ColorManager.white,
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
          return OnBoardingPage(_sliderList[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(AppStrings.skip, textAlign: TextAlign.end),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: const SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: Icon(Icons.chevron_left_rounded),
            ),
            onTap: () {
              // go to previous page
              _pageController.previousPage(
                duration: const Duration(milliseconds: AppDuration.d300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),

        //! circle indicators
        Row(
          children: [
            for (int i = 0; i < _sliderList.length; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i),
              )
          ],
        ),

        //! right arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: const SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: Icon(Icons.chevron_right_rounded),
            ),
            onTap: () {
              // go to next page
              _pageController.nextPage(
                duration: const Duration(milliseconds: AppDuration.d300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return const Icon(Icons.circle_outlined);
    } else {
      return const Icon(Icons.circle_rounded);
    }
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
