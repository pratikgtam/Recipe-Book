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
    this.actions,
  });
  final String? title;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool showAppBar;

  final PreferredSizeWidget? bottom;
  final PreferredSizeWidget? appBar;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        actions: actions,
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
