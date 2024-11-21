import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/firebase_options.dart';
import 'splash_screen.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';
import 'home_screen.dart';
import 'recipe_screen.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/signin': (context) => const SignInScreen(), // Sign In page route
        '/signup': (context) => const SignUpScreen(), // Sign Up page route
        '/home': (context) => const HomeScreen(),
        '/recipe': (context) => const RecipeDetailPage(
              recipeTitle: 'Recipe Title',
              recipeImage: 'assets/images/food_placeholder.jpg',
              ingredients: ['Ingredient 1', 'Ingredient 2'],
              directions: 'Step 1\nStep 2\nStep 3',
              description: '',
            ),
      },
    );
  }
}
