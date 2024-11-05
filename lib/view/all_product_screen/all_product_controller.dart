import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '/core/const_data/const_data.dart';
import '/model/all_product_model.dart';

class AllProductController extends GetxController {
  var products = <Product>[].obs;

  Future<void> fetchAllProducts() async {
    final url = Uri.parse('https://task.focal-x.com/api/products');
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ConstData.access_token}',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        products.value = ProductModel.fromJson(jsonData).data;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
