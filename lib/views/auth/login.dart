import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_input.dart';
import 'package:cosmetics/core/components/app_login_or_register.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  String? selectedCountryCode;
  final formKey = GlobalKey<FormState>();
  bool isLoginClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: formKey,
            onChanged: () {
              if (isLoginClicked) {
                formKey.currentState!.validate();
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(13.r).copyWith(top: 49.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppImage(
                      image: "login_img.png",
                      height: 227.h,
                      width: 284.w,
                    ),
                    Gap(24.h),
                    Center(
                      child: Text(
                        "Login Now",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Gap(14.h),
                    Center(
                      child: Text(
                        "Please enter the details below to continue",
                        style: TextStyle(
                          color: Color(0xff8E8EA9),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Gap(24.h),
                    AppInput(
                      withCountryCode: true,
                      isDense: false,
                      borderRadius: 8.r,
                      lable: "Phone Number",
                      controller: phoneController,
                      onCountryCodeChanged: (value) {
                        selectedCountryCode = value;
                      },
                      validator: InputValidator.phoneValidator,
                    ),
                    AppInput(
                      isDense: false,
                      borderRadius: 8.r,
                      lable: "Your Password",
                      isPassword: true,
                      bottomSpace: 0,
                      controller: passwordController,
                      validator: InputValidator.passwordValidator,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        onPressed: () {
                          goTo(ForgetPasswordView());
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Color(0xffD75D72),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Gap(44.h),
                    AppButton(
                      text: "Login",
                      isloading: false,
                      onPressed: () {
                        isLoginClicked = true;
                        if (formKey.currentState!.validate()) {
                          final phone = phoneController.text.trim();
                          final password = passwordController.text.trim();
                          print(phone);
                          print(password);
                          print(selectedCountryCode);
                        }

                        // goTo(HomeView(), preventPop: true);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: AppLoginOrRegister(),
      ),
    );
  }
}
