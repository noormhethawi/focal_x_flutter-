import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro/view/search/control/search_controller.dart';
import '/model/categoriesmodel.dart';
import '/view/all_product_screen/all_product_screen.dart';
import '/view/cart/categories_controller.dart';
import '/view/details/detilsscreen.dart';
import '/view/details/productcontroller.dart';
import '/widgets/design/design.dart';
import '/widgets/drawer/drawer.dart';
import '/widgets/product/productard.dart';
import '/widgets/shoppingbag/shoppingbag.dart';

class ExploreScreen extends StatelessWidget {
  final SearchControl controller = Get.put(SearchControl());
  final FocusNode searchFocusNode = FocusNode();

  final TextEditingController searchControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    Get.put(ProductController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: MyDrawer(),
        title: MyDesign(),
        centerTitle: true,
        actions: [MyShopBag()],
      ),
      body: Container(
        color: const Color.fromARGB(255, 247, 246, 246),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchControl,
                        focusNode: searchFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Looking for...',
                          hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              height: 20 / 12, // line height / font size
                              color: Color(
                                  0xFF6A6A6A) // لون النص يمكنك تغييره حسب الرغبة
                              ),
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        controller.fetchProducts(searchControl.text, context);
                        searchFocusNode
                            .unfocus(); // Ensure the TextField is unfocused
                      },
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        print("تم الضغط على الأيقونة");
                      },
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(1.0),
                          child: Image.asset(
                            'assets/details.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Category',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B2B2B)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GetBuilder<CategoriesController>(builder: (controller) {
                return Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final Datum category = controller.categories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => DetailScreen(categoryId: category.id));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            category.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF2B2B2B),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular T-shirt',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Raleway'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final ProductController productController =
                          Get.find<ProductController>();
                      await productController.getAllProducts();
                      Get.to(() => AllProductsScreen());
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 220,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductCarde(
                        imageUrl: 'assets/blose.jpg',
                        title: 'Programmer T-shirt',
                        price: '\$150.00',
                      ),
                      ProductCarde(
                        imageUrl: 'assets/blose.jpg',
                        title: 'Programmer T-shirt',
                        price: '\$752.00',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New Arrivals',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Raleway'),
                  ),
                  TextButton(
                    onPressed: () {
                      print("تم الضغط على See all في قسم New Arrivals");
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          'Summer Sale\n 15% OFF',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF674DC5),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -15,
                        bottom: 15,
                        right: 30,
                        child: Transform.rotate(
                          angle: 0.3,
                          child: SizedBox(
                            width: 90,
                            height: 90,
                            child: Image.asset(
                              'assets/blose.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
