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
    return SimpleDialog(
      children: [
        AppImage(image: "success.json", height: 100.h, width: 100.w),
        Column(
          children: [
            Text(
              isCreateAccount ? "Account Activated!" : "Password Created!",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Gap(4.h),
            Text(
              isCreateAccount
                  ? "Congratulations! Your account\n has been successfully activated"
                  : "Congratulations! Your password\n has been successfully created",
              style: TextStyle(color: Color(0xff8E8EA9), fontSize: 14.sp),
            ),
            Gap(26.h),
            AppButton(
              text: isCreateAccount ? "Go to home" : "Return to login",
              onPressed: () {
                (isCreateAccount)
                    ? goTo(HomeView(), preventPop: true)
                    : goTo(LoginView(), preventPop: true);
              },
            ),
          ],
        ),
      ],
    );
  }
}
