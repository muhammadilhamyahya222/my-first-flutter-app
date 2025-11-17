import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/datas/notifiers.dart';
import 'package:my_first_flutter_app/screens/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

// StatefulWidget is used when the UI can refresh and change
// StatelessWidget is used when the UI is cant refresh or change
// setState() is used to refresh the screen when the state changes

/* 
To build a Flutter app, follow these steps:
1. Material App with StatefulWidget: The root of the application that manages state.
2. Scaffold: Provides a structure for the app with app bar, body, etc.
3. Apptitle: The title of the app displayed in the app bar.
4. Bottom Navigation Bar with setState: Allows navigation between different screens and updates the UI when the selected index changes.
*/

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: MyHomePage(),
    );
  }
}
*/

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}
