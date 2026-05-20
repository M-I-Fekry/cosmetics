import 'package:cosmetics/core/components/app_back.dart';
import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_input.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(13.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBack(),
                AppImage(image: "logo.png", height: 62.h, width: 67.w),
                Gap(24.h),
                Center(
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gap(24.h),
                Text(
                  "Please enter your phone number below\n to recovery your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff8E8EA9), fontSize: 14.sp),
                ),
                Gap(62.h),
                AppInput(
                  withCountryCode: true,
                  isDense: false,
                  borderRadius: 8.r,
                  lable: "Phone Number",
                  bottomSpace: 56.h,
                ),
                AppButton(
                  text: "Next",
                  onPressed: () {
                    goTo(VerifyCodeView());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
