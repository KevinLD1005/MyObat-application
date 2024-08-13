import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myobat_application/theme/theme_provider.dart';

class KategoriListPage extends StatefulWidget {
  final Map<String, dynamic> kategoriData;

  const KategoriListPage({Key? key, required this.kategoriData})
      : super(key: key);

  @override
  State<KategoriListPage> createState() => _KategoriListPageState();
}

class _KategoriListPageState extends State<KategoriListPage> {
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
        title: const Text(
          'Kategori Data',
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

              // Iterate through the list of obat
              for (var obat in widget.kategoriData['data']) ...[
                Text(
                  '${obat['obat_nama']}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.themeData.colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Harga: Rp.${obat['harga']}',
                  style: TextStyle(
                    fontSize: 16,
                    color: themeProvider.themeData.colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 16,
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
                    '${obat['description']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: themeProvider.themeData.colorScheme.secondary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
