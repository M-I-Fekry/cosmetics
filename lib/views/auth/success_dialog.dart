import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SuccessDialogView extends StatelessWidget {
  const SuccessDialogView({super.key, this.isCreateAccount = false});
  final bool isCreateAccount;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xffD9D9D9),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(image: "success.json", height: 100.h, width: 100.w),
            Gap(20.h),
            Text(
              isCreateAccount ? "Account Activated!" : "Password Created!",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff434C6D),
              ),
              textAlign: TextAlign.center,
            ),
            Gap(12.h),
            Text(
              isCreateAccount
                  ? "Congratulations! Your account\nhas been successfully activated"
                  : "Congratulations! Your password\nhas been successfully created",
              style: TextStyle(color: const Color(0xff8E8EA9), fontSize: 13.sp),
              textAlign: TextAlign.center,
            ),
            Gap(32.h),
            AppButton(
              text: isCreateAccount ? "Go to home" : "Return to login",
              onPressed: () {
                (isCreateAccount)
                    ? goTo(const HomeView(), preventPop: true)
                    : goTo(const LoginView(), preventPop: true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
