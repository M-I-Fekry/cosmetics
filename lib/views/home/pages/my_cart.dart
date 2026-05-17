import 'package:cosmetics/core/components/app_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('My Cart'))),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You have 4 products in your cart',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff434C6D).withValues(alpha: .55),
              ),
            ),
            Gap(8),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 34,
                ).copyWith(top: 12, bottom: 100),
                itemBuilder: (context, index) => _Item(),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
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
  int itemCount = 0;
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
                width: 102,
                height: 102,
                fit: BoxFit.cover,
              ),
              Positioned(left: 4, top: 4, child: AppImage(image: 'delete.svg')),
            ],
          ),
        ),
        Gap(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Color(0xff3B4569),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'Note Cosmetics\n'),
                    TextSpan(
                      text: 'Ultra rich mascara for lashes\n\n',
                      style: TextStyle(
                        color: Color(0xff3B4569).withValues(alpha: .73),
                        fontSize: 12,
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
                    borderRadius: BorderRadius.circular(12),
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
                          fontSize: 16,
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
