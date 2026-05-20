import 'dart:async';
import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

void goTo(Widget page, {bool preventPop = false, int? delayInSeconds}) {
  void action() {
    final context = navKey.currentContext;
    if (context == null) return;

    if (preventPop) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => page),
        (route) => false,
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }
  }

  if (delayInSeconds != null) {
    Timer(Duration(seconds: delayInSeconds), action);
  } else {
    action();
  }
}
