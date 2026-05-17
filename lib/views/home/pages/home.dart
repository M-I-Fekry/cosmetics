import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/core/components/app_search.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSearch(),
                Gap(13),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AppImage(
                        image:
                            "https://i.pinimg.com/originals/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg",
                        width: double.infinity,
                        height: 320,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffE9DCD3).withValues(alpha: .8),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '50% OFF DISCOUNT \nCUPON CODE : 125865',
                                    style: TextStyle(
                                      color: Color(0xff62322D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                AppImage(image: 'offer.svg'),
                              ],
                            ),
                            Row(
                              children: [
                                AppImage(image: 'offer.svg'),
                                Expanded(
                                  child: Text(
                                    'Hurry up!\nSkin care only !',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Color(0xff434C6D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(24),
                Text(
                  'Top rated products',
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(24),
                GridView.builder(
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 176 / 237,
                  ),
                  itemBuilder: (context, index) => _Item(),
                ),
              ],
            ),
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
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .25),
            offset: Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 10,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: AppImage(
                image:
                    "https://i.pinimg.com/736x/11/f5/22/11f522c7f8ead5519a4b102723f0a89c.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(11),
          Text(
            'Face tint / lip tint',
            style: TextStyle(
              color: Color(0xff434C6D),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(6),
          Text(
            r'$44.99',
            style: TextStyle(
              color: Color(0xff70839C),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
