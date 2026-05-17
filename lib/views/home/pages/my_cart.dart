import 'package:cosmetics/core/components/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('My Cart'))),
      body: Padding(
        padding: EdgeInsets.all(13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You have 4 products in your cart',
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xff434C6D).withValues(alpha: .55),
              ),
            ),
            Gap(8.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 13.w,
                  vertical: 34.h,
                ).copyWith(top: 12.h, bottom: 100.h),
                itemBuilder: (context, index) => _Item(),
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Divider(),
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  const _Item({super.key});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8),
          child: Stack(
            children: [
              AppImage(
                image:
                    'https://avatars.mds.yandex.net/i?id=5b932e4fc75b8957d315c2ab5682dc402740d028-5477655-images-thumbs&n=13',
                width: 102.w,
                height: 102.h,
                fit: BoxFit.cover,
              ),
              Positioned(left: 4.w, top: 4.h, child: AppImage(image: 'delete.svg')),
            ],
          ),
        ),
        Gap(8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16.h),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Color(0xff3B4569),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'Note Cosmetics\n'),
                    TextSpan(
                      text: 'Ultra rich mascara for lashes\n\n',
                      style: TextStyle(
                        color: Color(0xff3B4569).withValues(alpha: .73),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: '350 EGP'),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff8E8EA9)),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (itemCount > 1) {
                            itemCount--;
                            setState(() {});
                          }
                        },
                        icon: AppImage(image: 'minus.svg'),
                      ),
                      Text(
                        "$itemCount",
                        style: TextStyle(
                          color: Color(0xff434C6D),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          itemCount++;
                          setState(() {});
                        },
                        icon: AppImage(image: 'plus.svg'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
