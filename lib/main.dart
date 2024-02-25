import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/features/auth/views/login_view.dart';
import 'package:recipe_book/features/recipe/ui/welcome.dart';
import 'package:recipe_book/firebase_options.dart';
import 'package:recipe_book/global_providers/global_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
      child: MaterialApp(
        title: 'Recipe Book',
        theme: getTheme(),
        home: FirebaseAuth.instance.currentUser != null
            ? const Welcome()
            : const LoginView(),
      ),
    );
  }

  ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      useMaterial3: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
            const Size(double.infinity, 48),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.teal),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.w400,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
