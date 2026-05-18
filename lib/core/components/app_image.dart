import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double? height, width;
  final bool isCircle;
  final Color? color;
  final double? bottomSpace;
  final BoxFit fit;

  const AppImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.isCircle = false,
    this.color,
    this.fit = BoxFit.scaleDown,
    this.bottomSpace,
  });

  @override
  Widget build(BuildContext context) {
    final myfit = isCircle ? BoxFit.cover : fit;

    return Padding(
      padding: bottomSpace != null
          ? EdgeInsets.only(bottom: bottomSpace!)
          : EdgeInsets.zero,
      child: Builder(
        builder: (context) {
          Widget child;
          if (image.isEmpty) return SizedBox.shrink();
          if (image.toLowerCase().endsWith("svg")) {
            child = SvgPicture.asset(
              "assets/icons/$image",
              color: color,
              height: height,
              width: width,
              fit: myfit,
            );
          } else if (image.startsWith("http")) {
            child = Image.network(
              image,
              height: height,
              width: width,
              color: color,
              fit: myfit,
            );
          } else if (image.endsWith("json")) {
            child = Lottie.asset(
              "assets/lotties/$image",
              height: height,
              width: width,
              fit: myfit,
            );
          } else {
            child = Image.asset(
              "assets/images/$image",
              color: color,
              height: height,
              width: width,
              fit: myfit,
            );
          }

          return isCircle ? ClipOval(child: child) : child;
        },
      ),
    );
  }
}
