import 'package:cosmetics/core/components/app_back.dart';
import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_input.dart';
import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/views/auth/verify_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final phoneController = TextEditingController();
  String? selectedCounteryCode;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
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
                      style: TextStyle(
                        color: Color(0xff8E8EA9),
                        fontSize: 14.sp,
                      ),
                    ),
                    Gap(62.h),
                    AppInput(
                      withCountryCode: true,
                      isDense: false,
                      borderRadius: 8.r,
                      lable: "Phone Number",
                      validator: InputValidator.phoneValidator,
                      controller: phoneController,
                      onCountryCodeChanged: (value) {
                        selectedCounteryCode = value;
                      },
                      bottomSpace: 56.h,
                    ),
                    AppButton(
                      text: "Next",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final resp = await DioHelper.sendData(
                            path: "api/Auth/forgot-password",
                            data: {
                              "countryCode": selectedCounteryCode,
                              "phoneNumber": phoneController.text,
                            },
                          );
                          if (resp!.isSuccess) {
                            goTo(
                              VerifyCodeView(
                                phoneNumber: phoneController.text,
                                countryCode: selectedCounteryCode ?? "+20",
                              ),
                            );
                          } else {
                            showMsg(resp.msg, isError: true);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
