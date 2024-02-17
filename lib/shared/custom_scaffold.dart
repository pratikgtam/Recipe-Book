import 'package:flutter/material.dart';
import 'package:recipe_book/shared/app_constants.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.title,
    required this.body,
    this.bottomNavigationBar,
    this.showAppBar = true,
    this.bottom,
    this.appBar,
  });
  final String? title;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool showAppBar;

  final PreferredSizeWidget? bottom;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 28,
        title: Text(
          title ?? '',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppConstants.horizontalScreenPadding,
            4,
            AppConstants.horizontalScreenPadding,
            0,
          ),
          child: body,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppConstants.horizontalScreenPadding,
                  4,
                  AppConstants.horizontalScreenPadding,
                  4,
                ),
                child: bottomNavigationBar,
              ),
            ),
    );
  }
}
