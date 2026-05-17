import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_search.dart';
import 'package:flutter/material.dart';
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
          padding: EdgeInsets.all(13),
          child: Column(
            children: [
              AppSearch(),
              Gap(24),
              ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 30,
                ).copyWith(bottom: 60),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => _Item(),
                itemCount: 10,
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
          width: 64,
          height: 64,
        ),
        Gap(12),
        Expanded(
          child: Text(
            'Bundles',
            style: TextStyle(
              color: Color(0xff434C6D),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        AppImage(image: 'arrow_right.svg'),
      ],
    );
  }
}
