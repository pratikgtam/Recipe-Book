import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:recipe_book/features/auth/views/login_view.dart';
import 'package:recipe_book/shared/app_button.dart';
import 'package:recipe_book/shared/app_routes.dart';
import 'package:recipe_book/shared/app_utils.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';

class CheckEmailView extends StatefulWidget {
  const CheckEmailView({super.key});

  @override
  State<CheckEmailView> createState() => _CheckEmailViewState();
}

class _CheckEmailViewState extends State<CheckEmailView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const Spacer(),
          const SizedBox(height: 20),
          const Text(
            'Check your email',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF203035),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'We have sent a password recover instructions to your email.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF789199),
                fontSize: 13,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          AppButton(
            label: 'Open mail app',
            onPressed: _onMailOpen,
          ),
          const SizedBox(height: 16),
          AppButton(
            label: 'Skip, I’ll confirm later',
            onPressed: _navigateToLogin,
            type: ButtonType.secondary,
          ),
          const SizedBox(height: 41),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      'Did not receive the email? Check your spam filter, or ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                  text: 'try another email address',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Future<void> _onMailOpen() async {
    final result = await OpenMailApp.openMailApp();

    if (mounted) {
      if (!result.didOpen && !result.canOpen) {
        AppUtils.showSnackbar(
          context,
          message: 'No mail apps installed',
        );
      } else {
        Future.delayed(
          const Duration(seconds: 2),
          _navigateToLogin,
        );
      }
    }
  }

  void _navigateToLogin() {
    AppRoutes(context).pushReplacement(const LoginView());
  }
}
