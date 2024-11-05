import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/model/productmodel.dart';
import '/view/my_cart/cart_controller.dart';
import '/view/my_cart/cart_screen.dart';
import '/view/favorite/favorite_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  final Datum1 product;
  final CartController cartController = Get.put(CartController());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.name} Shop'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$${product.price}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Type: ${product.subCategory.name}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.network(
                'https://task.focal-x.com/${product.image}',
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 10),
            Text(
              'programming and software Engineering Are you passion?\n Then this is made For You As A Developer . Perfect Surprice\n For Any programmer ,Software Engineer , Developre,Coder,\n computer nerd out there .....  ', // يمكنك تعديل هذا النص حسب الحاجة
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      if (!cartController.cartItems
                          .any((item) => item.id == product.id)) {
                        cartController.addToCart(product);
                        Get.to(() => CartScreen());
                      } else {
                        Get.snackbar(
                            'Info', 'This product is already in the cart.',
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: Text('Add to Cart'),
                  ),
                ),
                SizedBox(width: 10),
                Obx(() {
                  bool isFavorite = favoriteController.isFavorite(product);
                  return IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      if (isFavorite) {
                        favoriteController.removeFromFavorites(product);
                      } else {
                        favoriteController.addToFavorites(product);
                      }
                    },
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
