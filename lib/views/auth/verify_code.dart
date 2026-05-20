import 'package:cosmetics/core/components/app_back.dart';
import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_otp.dart';
import 'package:cosmetics/core/components/app_resend_otp.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:cosmetics/views/auth/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key, this.isCreateAccount = false});
  final bool isCreateAccount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                      "Verify Code",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Gap(24.h),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: isCreateAccount
                              ? "\t\t\t\tWe just sent a 4-digit verification code to\nyour email"
                              : "\t\tWe just sent a 4-digit verification code to\n",
                          style: TextStyle(
                            color: Color(0xff8E8EA9),
                            fontSize: 14.sp,
                            height: 1.7.h,
                          ),
                        ),
                        WidgetSpan(
                          child: Text(
                            isCreateAccount
                                ? " M_I_Fekry@gmail.com."
                                : "+20 1020304050.",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Color(0xff434C6D),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: isCreateAccount
                              ? " Enter\n the code in the box below to continue."
                              : " Enter the code in the box\n below to continue.",
                          style: TextStyle(
                            color: Color(0xff8E8EA9),
                            fontSize: 14.sp,
                            height: 1.7.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(40.h),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Edit the number",
                        style: TextStyle(
                          color: Color(0xffD75D72),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Gap(10.h),
                  AppOTP(),
                  Gap(24.h),
                  AppResendOTP(),
                  Gap(60.h),
                  AppButton(
                    text: "Done",
                    onPressed: () {
                      if (isCreateAccount) {
                        showDialog(
                          context: context,
                          builder: (context) => SuccessDialogView(
                            isCreateAccount: isCreateAccount,
                          ),
                        );
                      } else {
                        goTo(CreateNewPasswordView(), preventPop: true);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
