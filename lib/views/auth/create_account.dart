import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_input.dart';
import 'package:cosmetics/core/components/app_login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(13.r).copyWith(top: 49.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppImage(image: "logo.png", height: 62.h, width: 67.w),
                  Gap(24.h),
                  Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Gap(50.h),
                  AppInput(
                    isDense: false,
                    borderRadius: 8.r,
                    lable: "Your Name",
                  ),
                  Gap(16.h),
                  AppInput(isDense: false, borderRadius: 8.r, lable: "Email"),
                  AppInput(
                    withCountryCode: true,
                    isDense: false,
                    borderRadius: 8.r,
                    lable: "Phone Number",
                  ),
                  Gap(8.h),
                  AppInput(
                    isDense: false,
                    borderRadius: 8.r,
                    lable: "Create your password",
                    isPassword: true,
                  ),
                  AppInput(
                    isDense: false,
                    borderRadius: 8.r,
                    lable: "Confirm password",
                    isPassword: true,
                  ),
                  Gap(16.h),
                  AppButton(text: "Next"),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AppLoginOrRegister(isLogin: false),
      ),
    );
  }
}
