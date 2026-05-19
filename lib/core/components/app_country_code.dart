import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCountryCode extends StatefulWidget {
  const AppCountryCode({super.key});

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  late int selectedCountryCode;
  final list = [20, 966, 971];
  @override
  void initState() {
    super.initState();
    selectedCountryCode = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 6.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(
              context,
            ).inputDecorationTheme.enabledBorder!.borderSide.color,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButton<int>(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          value: selectedCountryCode,
          items: list
              .map((e) => DropdownMenuItem(value: e, child: Text("$e")))
              .toList(),
          onChanged: (value) {
            selectedCountryCode = value!;
            setState(() {});
          },
        ),
      ),
    );
  }
}
