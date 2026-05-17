import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text('Categories'))),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(13.w),
          child: Column(
            children: [
              AppSearch(),
              Gap(12.h),
              ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 13.w,
                  vertical: 30.h,
                ).copyWith(bottom: 60.h),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => _Item(),
                itemCount: 10,
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Divider(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(
          image:
              "https://i.pinimg.com/736x/dd/81/55/dd815570f18b9f13a54a566ef2f4a732.jpg",
          width: 64.w,
          height: 64.h,
        ),
        Gap(12.w),
        Expanded(
          child: Text(
            'Bundles',
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
