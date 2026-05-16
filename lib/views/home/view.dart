import 'package:cosmetics/core/components/app_image.dart';
import 'package:cosmetics/views/home/pages/categories.dart';
import 'package:cosmetics/views/home/pages/home.dart';
import 'package:cosmetics/views/home/pages/my_cart.dart';
import 'package:cosmetics/views/home/pages/profile.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final list = [
    _Model(icon: 'home.svg', page: HomePage()),
    _Model(icon: 'categories.svg', page: CategorieesPage()),
    _Model(icon: 'cart.svg', page: MyCartPage()),
    _Model(icon: 'profile.svg', page: ProfilePage()),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex].page,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 13),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .1),
            ),
            BoxShadow(
              offset: Offset(-4, -4),
              blurRadius: 6,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          elevation: 0,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          backgroundColor: Colors.transparent,
          items: List.generate(
            list.length,
            (index) => BottomNavigationBarItem(
              icon: AppImage(
                image: list[index].icon,
                color: currentIndex == index
                    ? Theme.of(context).primaryColor
                    : null,
              ),
              label: "",
            ),
          ),
        ),
      ),
    );
  }
}

class _Model {
  final String icon;
  final Widget page;

  _Model({required this.icon, required this.page});
}
