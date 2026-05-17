import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Montserrat",
          cardColor: Color(0xffD9D9D9),
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Color(0xff434C6D),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB3B3C1)),
              borderRadius: BorderRadius.circular(25),
            ),
            hintStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff8E8EA9),
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffDA498C)),
          scaffoldBackgroundColor: Color(0xffD9D9D9),
        ),
        home: child,
      ),
      child: HomeView(),
    );
  }
}
