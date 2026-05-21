import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final list = [
    _model(
      image: "on_boarding1.png",
      title: "WELCOME!",
      desc:
          "Makeup has the power to transform your mood and empowers you to be a more confident person.",
    ),
    _model(
      image: "on_boarding2.png",
      title: "SEARCH & PICK",
      desc:
          "We have dedicated set of products and routines hand picked for every skin type.",
    ),
    _model(
      image: "on_boarding3.png",
      title: "PUCH NOTIFICATIONS ",
      desc: "Allow notifications for new makeup & cosmetics offers.",
    ),
  ];

  int currentIndex = 0;

  void goToLogin() {
    goTo(LoginView(), preventPop: true);
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = currentIndex == list.length - 1;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 13.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!isLastPage)
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: goToLogin,
                    child: Text(
                      "skip",
                      style: TextStyle(
                        color: Color(0xff434C6D),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Gap(78.h),
              AppImage(
                image: list[currentIndex].image,
                height: 283.6.h,
                width: 259.6.w,
              ),
              Gap(27.9.h),
              Center(
                child: Text(
                  list[currentIndex].title,
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gap(10.h),
              Center(
                child: Text(
                  list[currentIndex].desc,
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(30.h),
              isLastPage
                  ? AppButton(
                      text: "let’s start!",
                      onPressed: goToLogin,
                      buttonColor: Color(0xff434C6D),
                    )
                  : Center(
                      child: FloatingActionButton(
                        backgroundColor: Color(0xff434C6D),
                        onPressed: () {
                          currentIndex++;
                          setState(() {});
                        },
                        child: AppImage(image: "forward_stroke_right.svg"),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _model {
  final String image, title, desc;

  _model({required this.image, required this.title, required this.desc});
}
