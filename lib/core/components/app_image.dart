import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatefulWidget {
  final String image;
  final double? height, width;
  final bool isCircle;
  final Color? color;
  final double? bottomSpace;
  final BoxFit fit;
  final VoidCallback? onLottieClicked;

  const AppImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.isCircle = false,
    this.color,
    this.fit = BoxFit.scaleDown,
    this.bottomSpace,
    this.onLottieClicked,
  });

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  @override
  void initState() {
    super.initState();
    if (widget.onLottieClicked != null) {
      _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myfit = widget.isCircle ? BoxFit.cover : widget.fit;

    return Padding(
      padding: widget.bottomSpace != null
          ? EdgeInsets.only(bottom: widget.bottomSpace!)
          : EdgeInsets.zero,
      child: Builder(
        builder: (context) {
          Widget child;
          if (widget.image.isEmpty) return SizedBox.shrink();
          if (widget.image.toLowerCase().endsWith("svg")) {
            child = SvgPicture.asset(
              "assets/icons/${widget.image}",
              color: widget.color,
              height: widget.height,
              width: widget.width,
              fit: myfit,
            );
          } else if (widget.image.startsWith("http")) {
            child = Image.network(
              widget.image,
              height: widget.height,
              width: widget.width,
              color: widget.color,
              errorBuilder: (context, error, stackTrace) => AppImage(
                image:
                    "https://c8.alamy.com/comp/2AXAP2A/error-template-icon-dead-site-page-not-found-404-trouble-with-system-eps-10-2AXAP2A.jpg",
                height: widget.height,
                width: widget.width,
                color: widget.color,
              ),
              fit: myfit,
            );
          } else if (widget.image.endsWith("json")) {
            child = Lottie.asset(
              "assets/lotties/${widget.image}",
              height: widget.height,
              width: widget.width,
              fit: myfit,
              controller: _controller,
            );

            if (widget.onLottieClicked != null) {
              child = GestureDetector(
                onTap: () {
                  if (_controller!.isCompleted) {
                    _controller!.reverse();
                  } else {
                    _controller!.forward();
                  }
                  widget.onLottieClicked?.call();
                },
                child: child,
              );
            }
          } else {
            child = Image.asset(
              "assets/images/${widget.image}",
              color: widget.color,
              height: widget.height,
              width: widget.width,
              fit: myfit,
            );
          }

          return widget.isCircle ? ClipOval(child: child) : child;
        },
      ),
    );
  }
}
