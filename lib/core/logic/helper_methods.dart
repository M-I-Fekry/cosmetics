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

void showMsg(String? msg, {bool isError = false}) {
  if (msg != null && msg.isNotEmpty) {
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                msg,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: isError
            ? const Color(0xffE64646)
            : const Color(0xff22C55E),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 12, left: 20, right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
    );
  }
}
