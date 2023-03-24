import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app_using_mvvm/presentation/resources/assets_manager.dart';
import 'package:shop_app_using_mvvm/presentation/resources/color_manager.dart';
import 'package:shop_app_using_mvvm/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() => _timer = Timer(const Duration(seconds: 2), _goNext);

  _goNext() => Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(image: AssetImage(ImageAssets.splashLogo)),
      ),
    );
  }
}
