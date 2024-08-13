import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as api;
import 'package:myobat_application/services/dio.dart';
// import 'package:myobat_application/services/auth.dart';

class CustomSearch extends SearchDelegate {
  Future<List<dynamic>> fetchMedications() async {
    try {
      api.Response response = await dio().get('show-obat');

      if (response.statusCode == 200) {
        List<dynamic> medications = response.data['data'];
        return medications;
      } else {
        throw Exception('Failed to load medications');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return []; // Return empty list in case of error
    }
  }

  // Demo list to show querying
  List<String> searchTerms = [
    "Panadol",
    "Paracetamol",
    "Ibuprofen",
    "Amoksisilin",
    "Ciprofloxcain",
    "Tramadol",
    "Anadex",
    "Demacolin"
  ];

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

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var obat in searchTerms) {
      if (obat.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(obat);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var obat in searchTerms) {
      if (obat.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(obat);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
