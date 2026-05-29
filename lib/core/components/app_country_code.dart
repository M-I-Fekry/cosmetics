import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCountryCode extends StatefulWidget {
  const AppCountryCode({super.key, required this.onCountryCodeChanged});
  final ValueChanged<String>? onCountryCodeChanged;

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  late String selectedCountryCode;
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<CountryModel>? list;
  Future<void> getData() async {
    final response = await Dio().get(
      "https://cosmatics.growfet.com/api/Countries",
    );
    list = CountriesData.fromJson({"list": response.data}).list;
    selectedCountryCode = list!.first.code;
    widget.onCountryCodeChanged?.call(selectedCountryCode);
    setState(() {});
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
        child: list == null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: const CupertinoActivityIndicator(),
              )
            : DropdownButton<String>(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                value: selectedCountryCode,
                items: list!
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.code,
                        child: Text("${e.code}"),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  selectedCountryCode = value!;
                  widget.onCountryCodeChanged?.call(selectedCountryCode);
                  setState(() {});
                },
              ),
      ),
    );
  }
}

class CountriesData {
  late final List<CountryModel> list;
  CountriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json["list"] ?? [],
    ).map((e) => CountryModel.fromJson(e)).toList();
  }
}

class CountryModel {
  late final int id;
  late final String code;
  late final String name;

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? "";
    name = json['name_en'] ?? "";
  }
}
