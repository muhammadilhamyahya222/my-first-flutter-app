import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/datas/notifiers.dart';
import 'package:my_first_flutter_app/screens/pages/home_page.dart';
import 'package:my_first_flutter_app/screens/pages/profile_page.dart';
import 'package:my_first_flutter_app/screens/pages/settings_page.dart';
import 'package:my_first_flutter_app/screens/widgets/navbar_widget.dart';

//* Initializing a nullable (?) String variable for the AppBar title
String? title = 'My Flutter App';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
        actions: [
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode);
              },
            ),
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push( // Use push to go to a new page, also can use push replacement to not be able to go back (can implement logout this way)
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: 'Settings',);
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
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
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
