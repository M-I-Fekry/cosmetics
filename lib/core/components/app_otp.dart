import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppOTP extends StatelessWidget {
  const AppOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      cursorColor: Color(0xff101010).withValues(alpha: .22),
      cursorWidth: 5.w,
      cursorHeight: 16.h,
      hintCharacter: "_",
      separatorBuilder: (builder, context) => SizedBox(width: 12.w),
      mainAxisAlignment: MainAxisAlignment.center,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.0.r),
        inactiveColor: Color(0XFF898992).withValues(alpha: .36),
        selectedColor: Color(0XFFD75D72),
        activeColor: Color(0XFFD75D72),
      ),
    );
  }
}
