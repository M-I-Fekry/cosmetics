import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.color,
    this.fit,
  });
  final String image;
  final double? height, width;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (image.endsWith("svg")) {
      return SvgPicture.asset(
        "assets/icons/$image",
        color: color,
        height: height,
        width: width,
        fit: fit ?? BoxFit.scaleDown,
      );
    } else if (image.startsWith("http")) {
      return Image.network(
        image,
        color: color,
        height: height,
        width: width,
        fit: fit ?? BoxFit.scaleDown,
      );
    }
    return Image.asset(
      "assets/icons/$image",
      color: color,
      height: height,
      width: width,
      fit: fit ?? BoxFit.scaleDown,
    );
  }
}
