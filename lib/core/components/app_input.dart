import 'package:cosmetics/core/components/app_country_code.dart';
import 'package:cosmetics/core/components/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    super.key,
    this.suffixIcon,
    this.hint,
    this.lable,
    this.withCountryCode = false,
    this.isDense = true,
    this.borderRadius,
    this.isPassword = false,
    this.bottomSpace,
    this.controller,
    this.onCountryCodeChanged,
    this.validator,
  });
  final String? suffixIcon, hint, lable;
  final bool withCountryCode, isPassword;
  final bool isDense;
  final double? borderRadius;
  final double? bottomSpace;
  final TextEditingController? controller;
  final ValueChanged<String>? onCountryCodeChanged;
  final FormFieldValidator<String>? validator;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.withCountryCode)
            AppCountryCode(onCountryCodeChanged: widget.onCountryCodeChanged),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              obscureText: widget.isPassword && isHidden,
              decoration: InputDecoration(
                labelText: widget.lable,
                hintText: widget.hint,
                isDense: widget.isDense,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 25.r,
                  ),
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          isHidden = !isHidden;
                          setState(() {});
                        },
                        icon: AppImage(
                          image: isHidden
                              ? "visibility_off.svg"
                              : "visibility.svg",
                        ),
                      )
                    : widget.suffixIcon != null
                    ? AppImage(image: widget.suffixIcon!, height: 18, width: 18)
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffB3B3C1)),
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 25.r,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffD75D72)),
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 25.r,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
