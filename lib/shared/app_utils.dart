import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/shared/app_constants.dart';
import 'package:recipe_book/shared/app_exceptions.dart';
import 'package:recipe_book/shared/models/result.dart';

class AppUtils {
  static void showSnackbar(
    BuildContext context, {
    required String? message,
  }) {
    if (message == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  static void handleError(
    BuildContext context,
    Result<void> data,
  ) {
    if (data.failed) {
      var errorMessage = AppConstants.generalErrorMessage;
      if (data.error is AppException) {
        final exception = data.error as AppException;
        errorMessage = exception.message;
      } else if (data.error is FirebaseAuthException) {
        final error = data.error as FirebaseAuthException;

        switch (error.code) {
          case 'INVALID_LOGIN_CREDENTIALS':
            errorMessage = 'Email or password is incorrect';
        }
      }

      AppUtils.showSnackbar(
        context,
        message: errorMessage,
      );
    }
  }

  static String getRandomImage() {
    return 'https://picsum.photos/id/500/800';
  }

  static double getTopPadding(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getBottomPadding(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getViewInsetsBottom(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  static String centsToDollars(int? cents) {
    if (cents == null) {
      return '\$0,00';
    }
    return '\$${(cents / 100).toStringAsFixed(2).replaceAll('.', ',')}';
  }
}

extension DateExtension on DateTime {
  String get toDisplay {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  }
}
