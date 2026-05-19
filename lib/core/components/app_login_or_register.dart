import 'package:cosmetics/views/auth/create_account.dart';
import 'package:flutter/material.dart';

class AppLoginOrRegister extends StatelessWidget {
  const AppLoginOrRegister({super.key, this.isLogin = true});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: isLogin ? "Don’t have an account?" : "Have an account?",
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                onPressed: () {
                  if (isLogin) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountView(),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  isLogin ? "Register" : "Login",
                  style: TextStyle(
                    color: Color(0xffD75D72),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
