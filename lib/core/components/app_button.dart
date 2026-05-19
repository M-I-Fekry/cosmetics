import 'package:cosmetics/core/components/app_image.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.text = "",
    this.onPressed,
    this.icon,
    this.buttonColor,
  });

  final VoidCallback? onPressed;
  final String? icon;
  final String text;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: icon != null ? AppImage(image: icon!) : null,
      onPressed: onPressed ?? () {},
      label: Text(text),
      style: FilledButton.styleFrom(backgroundColor: buttonColor),
    );
  }
}
