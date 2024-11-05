import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '/view/my_cart/cart_controller.dart';
import '/view/order/orderscreen.dart';
import '/view/order/ordercontroller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();
  final OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${cartController.cartItems.length} Item',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF1A2530),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final product = cartController.cartItems[index];
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green, // لون الخلفية
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(15)), // حواف دائرية
                            ),
                            padding:
                                EdgeInsets.all(8), // إضافة padding حول الأزرار
                            child: Column(
                              mainAxisSize: MainAxisSize
                                  .min, // ضبط الحجم العمودي كأصغر ما يمكن
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // محاذاة العناصر في المنتصف
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add,
                                      color: Colors.white,
                                      size: 24), // زيادة حجم الأيقونة
                                  onPressed: () {
                                    cartController.increaseQuantity(product);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove,
                                      color: Colors.white,
                                      size: 24), // زيادة حجم الأيقونة
                                  onPressed: () {
                                    cartController.decreaseQuantity(product);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              cartController.removeFromCart(product);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Card(
                        elevation: 2,
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: Image.network(
                                  'https://task.focal-x.com/${product.image}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1A2530)),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Price: \$${product.price}',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xFF1A2530)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '${product.quantity}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Cost:',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Obx(() {
                          double total = cartController.calculateTotalPrice();
                          return Text(
                            '\$${total.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        await cartController.checkout();
                        List<Map<String, dynamic>> orders =
                            cartController.cartItems.map((item) {
                          return {
                            'product_id': item.id,
                            'quantity': item.quantity,
                            'product_name': item.name,
                            'price': item.price,
                            'image': item.image,
                          };
                        }).toList();
                        Get.to(() => OrderScreen(
                              orders: orders,
                            ));
                      },
                      child: Text('Checkout'),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xFFFFFFFF))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
