import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myobat_application/theme/theme_provider.dart';
import 'package:myobat_application/services/auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<void> _userProfileFuture;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  void _fetchUserProfile() {
    final auth = Provider.of<Auth>(context, listen: false);
    setState(() {
      _userProfileFuture = auth.fetchUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final auth = Provider.of<Auth>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.primary,

      // App Bar
      appBar: AppBar(
        backgroundColor: themeProvider.themeData.colorScheme.background,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change your color here
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      // Body
      body: FutureBuilder<void>(
        future: _userProfileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final user = auth.user;
          if (user == null) {
            return const Center(child: Text('No user data available'));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Username
                  _buildLabel('Name', themeProvider),
                  const SizedBox(height: 10),
                  _buildInfoBox(context, user.name ?? 'N/A'),

                  const SizedBox(height: 20),

                  // Email
                  _buildLabel('Email', themeProvider),
                  const SizedBox(height: 10),
                  _buildInfoBox(context, user.email ?? 'N/A'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String label, ThemeProvider themeProvider) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: themeProvider.themeData.colorScheme.secondary,
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
