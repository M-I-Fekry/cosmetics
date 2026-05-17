import 'package:cosmetics/core/components/app_image.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  const AppInput({super.key, this.suffixIcon, this.hint});
  final String? suffixIcon, hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        suffixIcon: suffixIcon != null
            ? AppImage(image: suffixIcon!, height: 18, width: 18)
            : null,
      ),
    );
  }
}
