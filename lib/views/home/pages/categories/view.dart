import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_search.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
part 'components/item.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<CategoryModel>? list;

  Future<void> getData() async {
    final response = await Dio().get(
      "https://cosmatics.growfet.com/api/Categories",
    );

    list = CategoriesData.fromJson({"list": response.data}).list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
              list == null
                  ? Center(child: CupertinoActivityIndicator())
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 13.w,
                        vertical: 30.h,
                      ).copyWith(bottom: 60.h),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          _Item(model: list![index]),
                      itemCount: list!.length,
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

class CategoriesData {
  late final List<CategoryModel> list;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => CategoryModel.fromJson(e)).toList();
  }
}

class CategoryModel {
  late final int id;
  late final String title;
  late final String imageUrl;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title_en'] ?? "";
    imageUrl = json['image_url'] ?? "";
  }
}
