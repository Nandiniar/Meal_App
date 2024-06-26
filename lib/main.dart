import 'package:flutter/material.dart';
import 'package:meal_2/screens/meals.dart';
import 'screens/categories.dart';
import 'package:meal_2/data/dummy_dart.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),

);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: theme,
        home: const CategoriesScreen(),// from here
      // list of dummyMeals from dummy_dart.dart will be shown
    );
  }
}