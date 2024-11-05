import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro/core/service/routes.dart';
import '/model/productmodel.dart';
import '/view/favorite/favorite_controller.dart';

class Favoritescreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAllNamed(Routes.homescreen);
            },
          ),
          // InkWell(
          //   onTap: () {
          //     Get.back();
          //   },
          //   child: Icon(Icons.arrow_back),
          // ),
        ),
        title: Text('Favorites'),
      ),
      body: Obx(() {
        if (favoriteController.favoriteItems.isEmpty) {
          return Center(
            child: Text(
              'No items in favorites',
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        return GridView.builder(
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.7,
          ),
          itemCount: favoriteController.favoriteItems.length,
          itemBuilder: (context, index) {
            final Datum1 product = favoriteController.favoriteItems[index];
            return Card(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            'https://task.focal-x.com/${product.image}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BEST SELLER',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              product.name,
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2B2B2B)),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Price: \$${product.price}',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -10,
                    left: -10,
                    child: Obx(() {
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
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(width: 5),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
