import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as api;
import 'package:myobat_application/services/dio.dart';
import 'package:provider/provider.dart';
import 'package:myobat_application/theme/theme_provider.dart';
import 'package:myobat_application/pages/obat_details_page.dart';

class ObatSearch extends SearchDelegate<String> {
  late Future<List<String>> _searchTermsFuture;

  ObatSearch() {
    _searchTermsFuture = obatList();
  }

  // Get Obat Data
  Future<List<String>> obatList() async {
    try {
      api.Response response = await dio().get('/show-obat');

      if (response.statusCode == 200) {
        List<dynamic> obat = response.data['data'];
        List<String> obatNames =
            obat.map((med) => med['obat_nama'].toString()).toList();
        return obatNames;
      } else {
        throw Exception('Failed to load medications');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return []; // Return empty list in case of error
    }
  }

  // Search Specific Obat
  Future<Map<String, dynamic>?> searchObat(String namaObat) async {
    try {
      api.Response response = await dio().get(
        '/search-obat',
        queryParameters: {'nama_obat': namaObat},
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data['data'];
      } else {
        return null;
      }
    } on api.DioException catch (e) {
      print('Error searching for obat: $e');
      return null;
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

  // Match Obat Results
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
                    Map<String, dynamic>? obatData = await searchObat(result);
                    if (obatData != null) {
                      // Navigate to a new page or handle the data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ObatDetailsPage(obatData: obatData),
                        ),
                      );
                    } else {
                      // Handle case where no data is found or error occurred
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('No data found for $result'),
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

  // Show All Obat
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
