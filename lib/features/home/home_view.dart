import 'package:flutter/material.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Welcome',
      body: Center(
        child: Text('Welcome to the Recipe Book!'),
      ),
    );
  }
}
