import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  @override
  void initState() {
    super.initState();
    goTo(OnBoardingView(), delayInSeconds: 2, preventPop: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(
              image: "logo.png",
              height: 200.h,
              width: 200.w,
              bottomSpace: 16.h,
            ),
            AppImage(image: "splash_logo2.png", height: 46.h, width: 120.w),
          ],
        ),
      ),
    );
  }
}
