import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
      home: Scaffold(
        //* AppBar with centered title
        appBar: AppBar(title: Text('My Flutter App'), centerTitle: true),
        //* Drawer is Left side menu
        /*
        drawer: SafeArea(
          // Child is what is inside the Widget
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
        */
        //* Buttons at the end off screens that floating
        /*
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
            SizedBox(height: 16),
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
          ],
        ),
        */
        //* Bottom Navigation Bar with two destinations (Home and Profile)
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onDestinationSelected: (int value) {},
          selectedIndex: 0,
        ),
      ),
    );
  }
}
