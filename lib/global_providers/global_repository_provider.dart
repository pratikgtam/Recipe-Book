import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/auth/repositories/auth_repository.dart';
import 'package:recipe_book/shared/firebase_repository.dart';

class GlobalRepositoryProvider extends StatelessWidget {
  const GlobalRepositoryProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => FirebaseRepository(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
      ],
      child: child,
    );
  }
}
