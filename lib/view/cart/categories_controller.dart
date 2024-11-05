import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '/model/categoriesmodel.dart';

class CategoriesController extends GetxController {
  List<Datum> categories = [];

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  Future<void> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse('https://task.focal-x.com/api/categories'),
        headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer 1037|nCYLOmOF6cnQl7KS2AFs2eXtVEnTURqXpqeIntUice49c0c1'
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        CategoriesModel categoriesModel = CategoriesModel.fromJson(data);
        categories = categoriesModel.data;
        update();
      } else {
        print('Failed to load categories');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
