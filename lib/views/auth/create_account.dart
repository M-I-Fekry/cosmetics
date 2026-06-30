import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_input.dart';
import 'package:cosmetics/core/components/app_login_or_register.dart';
import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final createPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? selectedCounteryCode;
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
                    controller: nameController,
                  ),
                  Gap(16.h),
                  AppInput(
                    isDense: false,
                    borderRadius: 8.r,
                    lable: "Email",
                    controller: emailController,
                  ),
                  AppInput(
                    withCountryCode: true,
                    isDense: false,
                    borderRadius: 8.r,
                    lable: "Phone Number",
                    controller: phoneController,
                    onCountryCodeChanged: (value) {
                      selectedCounteryCode = value;
                    },
                  ),
                  Gap(8.h),
                  AppInput(
                    isDense: false,
                    borderRadius: 8.r,
                    lable: "Create your password",
                    controller: createPasswordController,
                    isPassword: true,
                  ),
                  AppInput(
                    isDense: false,
                    borderRadius: 8.r,
                    lable: "Confirm password",
                    controller: confirmPasswordController,
                    isPassword: true,
                  ),
                  Gap(16.h),
                  AppButton(
                    text: "Next",
                    onPressed: () async {
                      if (nameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          phoneController.text.isEmpty ||
                          createPasswordController.text.isEmpty) {
                        showMsg("Please fill all fields", isError: true);
                        return;
                      }

                      if (createPasswordController.text !=
                          confirmPasswordController.text) {
                        showMsg("Passwords do not match", isError: true);
                        return;
                      }

                      if (createPasswordController.text.length < 8) {
                        showMsg(
                          "Password must be at least 8 characters",
                          isError: true,
                        );
                        return;
                      }

                      Map<String, dynamic> requestData = {
                        "username": nameController.text,
                        "countryCode": selectedCounteryCode ?? "+20",
                        "phoneNumber": phoneController.text,
                        "email": emailController.text,
                        "password": createPasswordController.text,
                      };

                      final resp = await DioHelper.sendData(
                        path: "api/Auth/register",
                        data: requestData,
                      );

                      if (resp != null && resp.isSuccess) {
                        goTo(
                          VerifyCodeView(
                            isCreateAccount: true,
                            phoneNumber: phoneController.text,
                            countryCode: selectedCounteryCode ?? "+20",
                          ),
                        );
                      }else{
                        showMsg(resp?.msg ?? "Something went wrong, please try again.", isError: true);
                      }
                      
                    },
                  ),
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
