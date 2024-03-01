import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/features/add/cubits/add_cubit.dart';
import 'package:recipe_book/features/auth/cubits/auth_cubit.dart';
import 'package:recipe_book/features/profile/cubits/profile_cubit.dart';
import 'package:recipe_book/features/recipe/cubits/recipe_cubit.dart';

class GlobalCubitProvider extends StatelessWidget {
  const GlobalCubitProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            context.read(),
            context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => AddCubit(
            context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => RecipeCubit(
            context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(
            context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
