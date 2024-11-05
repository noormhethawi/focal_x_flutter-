import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pro/view/search/screen/search_screen.dart';
import '/core/const_data/const_data.dart';
import 'package:pro/model/productmodel.dart';
import 'package:flutter/material.dart';

class SearchControl extends GetxController {
  var productList = <Datum1>[].obs;
  var isLoading = false.obs;

  Future<void> fetchProducts(String query, BuildContext context) async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://task.focal-x.com/api/products'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${ConstData.access_token}',
        },
      );

      if (response.statusCode == 200) {
        List data = json.decode(response.body)['data'];
        productList.value = data
            .map((item) => Datum1.fromJson(item))
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

        // Navigate to the results page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultsPage(products: productList),
          ),
        );
      } else {
        throw Exception('Failed to load products');
      }
    } finally {
      isLoading(false);
    }
  }
}
