import 'package:animate_do/animate_do.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/create_account.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';

class AppLoginOrRegister extends StatelessWidget {
  const AppLoginOrRegister({super.key, this.isLogin = true});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: isLogin
                      ? "Don’t have an account? "
                      : "Have an account? ",
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
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      isLogin ? "Register" : "Login",
                      style: const TextStyle(
                        color: Color(0xffD75D72),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (isLogin) ...[
            const SizedBox(height: 4),
            TextButton(
              onPressed: () {
                goTo(HomeView(), preventPop: true);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                "Continue as a Guest",
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xff434C6D),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
