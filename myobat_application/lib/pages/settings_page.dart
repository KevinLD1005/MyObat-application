import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myobat_application/pages/info_page.dart';
import 'package:myobat_application/theme/theme_provider.dart';
import 'package:myobat_application/theme/theme.dart';
import 'package:myobat_application/pages/profile_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool darkModeEnabled = themeProvider.themeData == darkMode;

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.primary,

      // AppBar
      appBar: AppBar(
        backgroundColor: themeProvider.themeData.colorScheme.background,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change your color here
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      // Body
      body: ListView(
        children: [
          // Account
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Account',
              style: TextStyle(
                color: themeProvider.themeData.colorScheme.secondary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: themeProvider.themeData.colorScheme.secondary,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                color: themeProvider.themeData.colorScheme.secondary,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),

          // Preferences
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Preferences',
              style: TextStyle(
                color: themeProvider.themeData.colorScheme.secondary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Mode
          SwitchListTile(
            activeColor: Colors.white,
            inactiveTrackColor: Colors.black,
            secondary: Icon(
              Icons.dark_mode,
              color: themeProvider.themeData.colorScheme.secondary,
            ),
            title: Text(
              'Dark Mode',
              style: TextStyle(
                color: themeProvider.themeData.colorScheme.secondary,
              ),
            ),
            value: darkModeEnabled,
            onChanged: (bool value) {
              setState(
                () {
                  themeProvider.toggleTheme(value);
                },
              );
            },
          ),

          // Others
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Others',
              style: TextStyle(
                color: themeProvider.themeData.colorScheme.secondary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // About
          ListTile(
            leading: Icon(
              Icons.info,
              color: themeProvider.themeData.colorScheme.secondary,
            ),
            title: Text(
              'About',
              style: TextStyle(
                color: themeProvider.themeData.colorScheme.secondary,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InfoPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
