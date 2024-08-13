import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myobat_application/theme/theme_provider.dart';

// Pages
import 'package:myobat_application/pages/login_or_register.dart';
import 'package:myobat_application/pages/search_obat.dart';
import 'package:myobat_application/pages/search_kategori.dart';
import 'package:myobat_application/pages/info_page.dart';
import 'package:myobat_application/pages/settings_page.dart';

// Auth
import 'package:myobat_application/services/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final api = Auth();
  final List<String> carouselTexts = [
    'Welcome to MyObat!',
    'Stay updated with the latest medication information.',
    'Your trusted drug reference application.',
  ];

  void logout() async {
    try {
      await api.logout();
      navigateToLoginPage();
    } catch (e) {
      showErrorSnackBar(
          'An error occurred while logging out. Please try again.');
    }
  }

  void navigateToLoginPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginOrRegister(),
      ),
      (route) => false,
    );
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.primary,

      // AppBar
      appBar: AppBar(
        backgroundColor: themeProvider.themeData.colorScheme.background,
        title: const Text(
          "MyObat Application",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              color: Colors.white,
              icon: const Icon(Icons.menu),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ObatSearch(),
              );
            },
            color: Colors.white,
            icon: const Icon(Icons.search),
          ),
        ],
      ),

      // Menu Drawer
      drawer: Drawer(
        backgroundColor: themeProvider.themeData.colorScheme.primary,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: themeProvider.themeData.colorScheme.background),
              child: const Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: themeProvider.themeData.colorScheme.secondary,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: themeProvider.themeData.colorScheme.secondary,
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: themeProvider.themeData.colorScheme.secondary,
              ),
              title: Text(
                'Info',
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
            ListTile(
              leading: Icon(
                Icons.logout,
                color: themeProvider.themeData.colorScheme.secondary,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),
              onTap: () {
                logout();
              },
            ),
          ],
        ),
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),

              // Carousel Slider for text announcements
              CarouselSlider(
                options: CarouselOptions(
                  height: 100.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: carouselTexts.map((text) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: themeProvider.themeData.colorScheme.background,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              text,
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // Welcome Text
              Text(
                'Welcome to MyObat',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Welcome to MyObat, your comprehensive drug reference application designed to provide '
                'reliable information about various medications. Whether you are a healthcare '
                'professional, a student, or simply someone seeking to understand more about the medications you '
                'or your loved ones are taking, MyObat is here to assist you.',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 20),

              // Grid View for Quick Access
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: <Widget>[
                  quickAccessCard(
                    icon: Icons.search,
                    label: 'Search Obat',
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: ObatSearch(),
                      );
                    },
                  ),
                  quickAccessCard(
                    icon: Icons.medication,
                    label: 'Search Kategori',
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: KategoriSearch(),
                      );
                    },
                  ),
                  quickAccessCard(
                    icon: Icons.info,
                    label: 'Info',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InfoPage(),
                        ),
                      );
                    },
                  ),
                  quickAccessCard(
                    icon: Icons.settings,
                    label: 'Settings',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget quickAccessCard(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Provider.of<ThemeProvider>(context)
            .themeData
            .colorScheme
            .onBackground,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 40.0,
                color: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .secondary,
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
