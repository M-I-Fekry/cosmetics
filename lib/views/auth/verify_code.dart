import 'package:cosmetics/core/components/app_back.dart';
import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_otp.dart';
import 'package:cosmetics/core/components/app_resend_otp.dart';
import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:cosmetics/views/auth/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({
    super.key,
    this.isCreateAccount = false,
    this.phoneNumber,
    this.countryCode,
  });
  final bool isCreateAccount;
  final String? phoneNumber;
  final String? countryCode;

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  final otpController = TextEditingController();
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
                          text: widget.isCreateAccount
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
                            widget.isCreateAccount
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
                          text: widget.isCreateAccount
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
                  AppOTP(controller: otpController),
                  Gap(24.h),
                  AppResendOTP(
                    onResend: () async {
                      final resp = await DioHelper.sendData(
                        path: "api/Auth/resend-otp",
                        data: {
                          "countryCode": widget.countryCode,
                          "phoneNumber": widget.phoneNumber,
                        },
                      );
                      if (resp != null && resp.isSuccess) {
                        showMsg("Verification code has been resent!");
                      } else {
                        showMsg(
                          resp?.msg ?? "Error resending code",
                          isError: true,
                        );
                      }
                    },
                  ),
                  Gap(60.h),
                  AppButton(
                    text: "Done",
                    onPressed: () async {
                      if (otpController.text.isEmpty) {
                        showMsg("Please enter the code", isError: true);
                        return;
                      }

                      final resp = await DioHelper.sendData(
                        path: "api/Auth/verify-otp",
                        data: {
                          "countryCode": widget.countryCode,
                          "phoneNumber": widget.phoneNumber,
                          "otpCode": otpController.text,
                        },
                      );

                      if (resp != null && resp.isSuccess) {
                        if (widget.isCreateAccount) {
                          showDialog(
                            context: context,
                            builder: (context) => SuccessDialogView(
                              isCreateAccount: widget.isCreateAccount,
                            ),
                          );
                        } else {
                          goTo(
                            CreateNewPasswordView(
                              countryCode: widget.countryCode,
                              phoneNumber: widget.phoneNumber,
                            ),
                            preventPop: true,
                          );
                        }
                      } else {
                        showMsg(
                          resp?.msg ?? "Invalid code, please try again.",
                          isError: true,
                        );
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
