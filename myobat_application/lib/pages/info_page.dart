import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myobat_application/theme/theme_provider.dart';
// import 'package:myobat_application/theme/theme.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.primary,

      // AppBar
      appBar: AppBar(
        backgroundColor: themeProvider.themeData.colorScheme.background,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change your color here
        ),
        title: const Text(
          "Info Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 50),

              // Logo
              Center(
                child: Image.asset(
                  'lib/images/none-logo-3.png',
                  height: 150,
                  width: 150,
                ),
              ),

              const SizedBox(height: 50),

              // About App
              Text(
                'About App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              // About App Text
              Text(
                'Welcome to MyObat, your comprehensive drug reference application designed to provide '
                'reliable information about various medications. Whether you are a healthcare '
                'professional, a student, or simply someone seeking to understand more about the medications you '
                'or your loved ones are taking, MyObat is here to assist you.',
                style: TextStyle(
                    fontSize: 16,
                    color: themeProvider.themeData.colorScheme.secondary),
              ),

              const SizedBox(height: 20),

              // What is MyObat?
              Text(
                'What is MyObat?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              // What is MyObat? Text
              Text(
                'MyObat is like a dictionary for medicines, providing detailed and easily accessible information  '
                'about a wide range of medications. Our goal is to make understanding drugs simple and  '
                'straightforward, helping you make informed decisions about your health and treatment options. ',
                style: TextStyle(
                    fontSize: 16,
                    color: themeProvider.themeData.colorScheme.secondary),
              ),

              const SizedBox(height: 20),

              // Key Features
              Text(
                'Key Features',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              // Key Features Text
              Text(
                'MyObat includes several features such as. ',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              // Comphensive Medicine
              Text(
                'Comprehensive Medicine Entries',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.themeData.colorScheme.secondary),
              ),

              const SizedBox(height: 1),

              // Comphensive Medicine Text
              Text(
                'Each Entry in MyObat includes: ',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 1),

              // Key Features List
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildFeatureItem('Drug Name',
                      'Common or scientific name of the medicine.'),
                  _buildFeatureItem('Category',
                      'The category of diseases or conditions for which the medicine is used.'),
                  _buildFeatureItem(
                      'Price', 'Includes the price of the medicine'),
                  _buildFeatureItem('Description',
                      'An in-depth description of how to use the medication and the diseases or conditions it is intended to treat.'),
                ],
              ),

              const SizedBox(height: 20),

              // Easy-to-Use Interface
              Text(
                'Easy-to-Use Interface',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              // Easy-to-Use Interface Text
              Text(
                'Our user-friendly interface ensures that finding information is quick and hassle-free. '
                'Navigate through the app with ease and locate the details you need without any complexity.',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 20),

              // Powerful Search Functionality
              Text(
                'Powerful Search Functionality',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              // Powerful Search Functionality
              Text(
                'Effortlessly search for medications by name, category, or medical condition. '
                'Our advanced search engine helps you find accurate information in seconds.',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 20),

              // Credits
              Text(
                'Credits',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              // Credits Text
              Text(
                'Developed by KelompokNONE 2024',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  // Bullet list
  Widget _buildFeatureItem(String title, String description) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '• ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: themeProvider.themeData.colorScheme.secondary,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.themeData.colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: themeProvider.themeData.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
