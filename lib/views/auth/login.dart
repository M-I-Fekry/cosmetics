import 'package:cosmetics/core/components/app_button.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_input.dart';
import 'package:cosmetics/core/components/app_login_or_register.dart';
import 'package:cosmetics/core/logic/cache_helper.dart';
import 'package:cosmetics/core/logic/dio_helper.dart';
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
  final phoneController = TextEditingController(text: "1551825601");
  final passwordController = TextEditingController(text: "Fekry112233");
  String? selectedCountryCode;
  final formKey = GlobalKey<FormState>();
  bool isLoginClicked = false;

  DataState? state;

  Future<void> sendData() async {
    state = DataState.loading;
    setState(() {});
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    final resp = await DioHelper.sendData(
      path: "api/Auth/login",
      data: {
        "countryCode": selectedCountryCode,
        "phoneNumber": phone,
        "password": password,
      },
    );
    if (resp!.isSuccess) {
      state = DataState.success;
      showMsg("Login Success");
      final data = UserData.fromJson(resp.data);
      await CacheHelper.saveUserData(data: data);
      goTo(HomeView(), preventPop: true);
    } else {
      state = DataState.failed;
      showMsg(resp.msg, isError: true);
    }
    setState(() {});
  }

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
                      isloading: state == DataState.loading,
                      onPressed: () {
                        isLoginClicked = true;
                        if (formKey.currentState!.validate()) {
                          sendData();
                        }
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

class UserData {
  late final String token;
  late final UserModel user;

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? "";
    user = UserModel.fromJson(json['user']);
  }
}

class UserModel {
  late final int id;
  late final String username;
  late final String email;
  late final String phoneNumber;
  late final String countryCode;
  late final String role;
  late final String profilePhotoUrl;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    username = json['username'] ?? "";
    email = json['email'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    countryCode = json['countryCode'] ?? "";
    role = json['role'] ?? "";
    profilePhotoUrl = json['profilePhotoUrl'] ?? "";
  }
}
