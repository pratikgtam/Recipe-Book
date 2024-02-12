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
      title: 'Check your email',
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'We have sent a password recover instructions to your email.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          const Icon(
            Icons.email,
            size: 100,
          ),
          const Spacer(),
          const Spacer(),
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
