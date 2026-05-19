import 'dart:math';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBack extends StatelessWidget {
  const AppBack({super.key, this.paddingStart = 0});
  final double paddingStart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: paddingStart),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: CircleAvatar(
            radius: 18.r,
            backgroundColor: const Color(0xff101010).withValues(alpha: .05),
            child: Transform.rotate(
              angle: 2 * pi,
              child: AppImage(
                image: "forward_stroke.svg",
                height: 26.h,
                width: 26.h,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
