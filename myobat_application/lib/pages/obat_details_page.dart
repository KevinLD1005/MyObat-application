import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myobat_application/theme/theme_provider.dart';

class ObatDetailsPage extends StatefulWidget {
  final Map<String, dynamic> obatData;

  const ObatDetailsPage({Key? key, required this.obatData}) : super(key: key);

  @override
  State<ObatDetailsPage> createState() => _ObatDetailsPageState();
}

class _ObatDetailsPageState extends State<ObatDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.primary,

      // App Bar
      appBar: AppBar(
        backgroundColor: themeProvider.themeData.colorScheme.background,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change your color here
        ),
        title: Text(
          '${widget.obatData['obat_nama']}',
          style: const TextStyle(
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

              // Nama
              Text(
                'Nama Obat',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              // Obat Name
              Text(
                '${widget.obatData['obat_nama']}',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 20),

              // Kategori
              Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              // Kategori Obat
              Text(
                '${widget.obatData['kategori_nama']}',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 20),

              // Harga
              Text(
                'Harga',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              // Harga Obat
              Text(
                'Rp.${widget.obatData['harga']}',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 20),

              // Description
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeData.colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: themeProvider.themeData.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: themeProvider.themeData.colorScheme.secondary,
                  ),
                ),
                child: Text(
                  '${widget.obatData['description']}',
                  style: TextStyle(
                    fontSize: 16,
                    color: themeProvider.themeData.colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
