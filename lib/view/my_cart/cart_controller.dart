import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '/model/productmodel.dart';
import '/view/order/ordercontroller.dart';
import '/view/order/orderscreen.dart';

class CartController extends GetxController {
  var cartItems = <Datum1>[].obs;
  final OrderController orderController = Get.put(OrderController());
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  void addToCart(Datum1 product) {
    if (!cartItems.any((item) => item.id == product.id)) {
      cartItems.add(product);
      saveCartItems();
    } else {
      Get.snackbar('Info', 'This product is already in the cart.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void removeFromCart(Datum1 product) {
    cartItems.remove(product);
    saveCartItems();
  }

  void increaseQuantity(Datum1 product) {
    product.quantity += 1;
    cartItems.refresh();
    saveCartItems();
  }

  void decreaseQuantity(Datum1 product) {
    if (product.quantity > 1) {
      product.quantity -= 1;
      cartItems.refresh();
      saveCartItems();
    }
  }

  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void saveCartItems() {
    List<String> cartItemsJson =
        cartItems.map((item) => jsonEncode(item.toJson())).toList();
    storage.write('cartItems', cartItemsJson);
  }

  void loadCartItems() {
    List<dynamic>? cartItemsJson = storage.read('cartItems');
    if (cartItemsJson != null) {
      cartItems.value = cartItemsJson
          .map((item) => Datum1.fromJson(jsonDecode(item as String)))
          .toList();
    }
  }

  Future<void> checkout() async {
    if (cartItems.isNotEmpty) {
      await orderController.createOrder(cartItems.toList());
      clearCart();
      final orders = await orderController.fetchOrders();

      Get.to(() => OrderScreen(orders: orders));
    } else {
      Get.snackbar('Warning', 'No items in the cart to checkout.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void clearCart() {
    cartItems.clear();
    saveCartItems();
  }
}
