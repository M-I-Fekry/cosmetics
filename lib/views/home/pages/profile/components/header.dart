part of '../view.dart';

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 232.h,
      child: Stack(
        children: [
          Container(
            height: 152.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0, 1],
                colors: [
                  const Color(0xffECA4C5),
                  const Color(0xff434C6D).withValues(alpha: .03),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppImage(
                  height: 96.h,
                  width: 96.h,
                  isCircle: true,
                  image: CacheHelper.image ,
                ),
                Gap(8.h),
                Text(
                  CacheHelper.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff434C6D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
