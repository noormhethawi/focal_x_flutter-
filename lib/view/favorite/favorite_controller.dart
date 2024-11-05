import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '/model/productmodel.dart';
import 'dart:convert';

class FavoriteController extends GetxController {
  var favoriteItems = <Datum1>[].obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() {
    List<dynamic>? storedFavorites = storage.read<List<dynamic>>('favorites');
    if (storedFavorites != null) {
      favoriteItems.value = storedFavorites
          .whereType<String>()
          .map((item) => Datum1.fromJson(jsonDecode(item)))
          .toList();
    }
  }

  void addToFavorites(Datum1 product) {
    if (!favoriteItems.any((item) => item.id == product.id)) {
      favoriteItems.add(product);
      saveFavorites();
    } else {
      Get.snackbar('Info', 'This product is already in favorites.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void removeFromFavorites(Datum1 product) {
    favoriteItems.removeWhere((item) => item.id == product.id);
    saveFavorites();
  }

  void saveFavorites() {
    List<String> storedFavorites =
        favoriteItems.map((item) => jsonEncode(item.toJson())).toList();
    storage.write('favorites', storedFavorites);
  }

  bool isFavorite(Datum1 product) {
    return favoriteItems.any((item) => item.id == product.id);
  }
}
