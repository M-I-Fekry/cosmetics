import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/logic/cache_helper.dart';
import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

part 'components/item.dart';
part 'components/header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final resp = await DioHelper.getData("api/Auth/profile");
    if (resp!.isSuccess) {
      final model = UserModel.fromJson(resp.data);
      await CacheHelper.saveUserData(model: model);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(24.h),
                  _Item(title: "Edit Info"),
                  _Item(title: "Order History"),
                  _Item(title: "Wallet"),
                  _Item(title: "Settings"),
                  _Item(title: "Voucher"),
                  _Item(title: "Logout", destinationPage: const LoginView()),
                  Gap(30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
