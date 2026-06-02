import 'package:animate_do/animate_do.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/logic/cache_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/home/view.dart';
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
    goTo(
      CacheHelper.isFirstTime
          ? OnBoardingView()
          : CacheHelper.isAuth
          ? HomeView()
          : LoginView(),
      delayInSeconds: 2,
      preventPop: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ZoomIn(
              child: AppImage(
                image: "logo.png",
                height: 200.h,
                width: 200.w,
                bottomSpace: 16.h,
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: AppImage(
                image: "splash_logo2.png",
                height: 46.h,
                width: 120.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
