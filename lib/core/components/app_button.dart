import 'package:cosmetics/core/components/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.text = "",
    this.onPressed,
    this.icon,
    this.buttonColor,
    this.isloading = false,
  });

  final VoidCallback? onPressed;
  final String? icon;
  final String text;
  final Color? buttonColor;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: icon != null ? AppImage(image: icon!) : const SizedBox.shrink(),
      onPressed: onPressed ?? () {},
      label: Text(text),
      style: FilledButton.styleFrom(
        backgroundColor: buttonColor,
        fixedSize: Size(double.maxFinite, 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
      ),
    );
  }
}
