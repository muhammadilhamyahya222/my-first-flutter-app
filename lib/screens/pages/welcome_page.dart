import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/datas/notifiers.dart';
import 'package:my_first_flutter_app/screens/widget_tree.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, _) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      isDarkMode ? Colors.white : Colors.transparent,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return WidgetTree();
                  }),
                );
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
