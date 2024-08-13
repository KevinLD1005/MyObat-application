import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as api;
import 'package:myobat_application/services/dio.dart';
import 'package:provider/provider.dart';
import 'package:myobat_application/theme/theme_provider.dart';
import 'package:myobat_application/pages/kategori_list_page.dart';

class KategoriSearch extends SearchDelegate<String> {
  late Future<List<String>> _searchTermsFuture;

  KategoriSearch() {
    _searchTermsFuture = kategoriList();
  }

  // Get Obat Data
  Future<List<String>> kategoriList() async {
    try {
      api.Response response = await dio().get('/show-kategori');
      if (response.statusCode == 200) {
        List<dynamic> kategori = response.data['data'];
        List<String> kategoriNames =
            kategori.map((med) => med['kategori_nama'].toString()).toList();
        return kategoriNames;
      } else {
        throw Exception('Failed to load medications');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return []; // Return empty list in case of error
    }
  }

  Future<List<Map<String, dynamic>>> searchKategori(String namaKategori) async {
    try {
      print('Searching for kategori: $namaKategori'); // Debug
      api.Response response = await dio().get(
        '/kategori-data',
        queryParameters: {
          'nama_kategori': namaKategori,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        List<Map<String, dynamic>> obatList =
            List<Map<String, dynamic>>.from(data);
        print('Data received: $obatList'); // Debug
        return obatList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Exception: $e'); // Debug
      throw e;
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: themeProvider.themeData.colorScheme.background,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 20),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white54),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, ''); // Pass an empty string to indicate cancellation
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return FutureBuilder<List<String>>(
      future: _searchTermsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No medications found.'));
        } else {
          List<String> searchTerms = snapshot.data!;
          List<String> matchQuery = searchTerms
              .where((term) => term.toLowerCase().contains(query.toLowerCase()))
              .toList();

          return Container(
            color: themeProvider.themeData.colorScheme.primary,
            child: ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                var result = matchQuery[index];
                return ListTile(
                  title: Text(
                    result,
                    style: TextStyle(
                      color: themeProvider.themeData.colorScheme.secondary,
                    ),
                  ),
                  onTap: () async {
                    // Handle tapping on search result
                    try {
                      List<Map<String, dynamic>> kategoriData =
                          await searchKategori(result);
                      // Navigate to a new page or handle the data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KategoriListPage(
                              kategoriData: {'data': kategoriData}),
                        ),
                      );
                    } catch (e) {
                      print('Error: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to load data for $result'),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return FutureBuilder<List<String>>(
      future: _searchTermsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No medications found.'));
        } else {
          List<String> searchTerms = snapshot.data!;
          List<String> matchQuery = searchTerms
              .where((term) => term.toLowerCase().contains(query.toLowerCase()))
              .toList();

          return Container(
            color: themeProvider.themeData.colorScheme.primary,
            child: ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                var result = matchQuery[index];
                return ListTile(
                  title: Text(
                    result,
                    style: TextStyle(
                      color: themeProvider.themeData.colorScheme.secondary,
                    ),
                  ),
                  onTap: () {
                    // Handle tapping on suggestion
                    query = result;
                    showResults(context);
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
