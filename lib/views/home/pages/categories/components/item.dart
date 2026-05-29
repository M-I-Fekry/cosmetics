part of '../view.dart';
class _Item extends StatelessWidget {
  const _Item({super.key, required this.model});
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(
          image:model.imageUrl,
          width: 64.w,
          height: 64.h,
        ),
        Gap(12.w),
        Expanded(
          child: Text(
            model.title,
            style: TextStyle(
              color: Color(0xff434C6D),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        AppImage(image: 'arrow_right.svg'),
      ],
    );
  }
}
