import 'package:cosmetics/core/components/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

part 'components/item.dart';
part 'components/header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                  _Item(title: "Edit Info", onTap: () {}),
                  _Item(title: "Order History", onTap: () {}),
                  _Item(title: "Wallet", onTap: () {}),
                  _Item(title: "Settings", onTap: () {}),
                  _Item(title: "Voucher", onTap: () {}),
                  _Item(title: "Logout", onTap: () {}),
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
