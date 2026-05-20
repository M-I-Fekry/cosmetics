import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_input.dart';
import 'package:cosmetics/views/auth/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Create Password",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gap(24.h),
                Text(
                  "The password should have at least \n6 characters.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff8E8EA9), fontSize: 14.sp),
                ),
                Gap(62.h),
                AppInput(
                  isDense: false,
                  borderRadius: 8.r,
                  lable: "New password",
                  isPassword: true,
                  bottomSpace: 16.h,
                ),
                AppInput(
                  isDense: false,
                  borderRadius: 8.r,
                  lable: "Confirm password",
                  isPassword: true,
                  bottomSpace: 56.h,
                ),
                AppButton(
                  text: "Confirm",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => SuccessDialogView(),
                    );
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
