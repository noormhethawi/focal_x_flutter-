import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '/core/const_data/const_data.dart';
import '/model/productmodel.dart';

class ProductController extends GetxController {
  List<Datum1> categories = [];
  var isLoading = false.obs;
  Future<void> getProductsByCategory(int categoryId) async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(
            'https://task.focal-x.com/api/products?categoryId=$categoryId'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${ConstData.access_token}'
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        CategoriesModel categoriesModel = CategoriesModel.fromJson(data);
        categories = categoriesModel.data;
        update();
      } else {
        print('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAllProducts() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('https://task.focal-x.com/api/products'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${ConstData.access_token}'
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        CategoriesModel categoriesModel = CategoriesModel.fromJson(data);
        categories = categoriesModel.data;
        update();
      } else {
        print('Failed to load all products');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
