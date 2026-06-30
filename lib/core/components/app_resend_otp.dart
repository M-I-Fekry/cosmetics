import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AppResendOTP extends StatefulWidget {
  const AppResendOTP({super.key, this.onResend});
  final VoidCallback? onResend;

  @override
  State<AppResendOTP> createState() => _AppResendOTPState();
}

class _AppResendOTPState extends State<AppResendOTP> {
  bool isSent = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Text(
              "Didn’t receive a code?",
              style: TextStyle(
                color: Color(0xff434C6D),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(2.w),
            TextButton(
              onPressed: isSent
                  ? null
                  : () {
                      if (widget.onResend != null) {
                        widget.onResend!();
                      }
                      isSent = true;
                      setState(() {});
                    },
              child: Text(
                "Resend",
                style: TextStyle(
                  color: isSent
                      ? Color(0xff8E8EA9)
                      : Color(0xffD75D72).withValues(alpha: .54),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(),
            if (isSent)
              CircularCountDownTimer(
                width: 50,
                height: 40,
                duration: 45,
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff8E8EA9),
                  fontSize: 12.sp,
                ),
                fillColor: Colors.transparent,
                ringColor: Colors.transparent,
                onComplete: () {
                  isSent = false;
                  setState(() {});
                },
              ),
          ],
        ),
      ),
    );
  }
}
