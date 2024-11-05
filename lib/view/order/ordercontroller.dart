import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '/core/const_data/const_data.dart';
import '/model/productmodel.dart';
import '/view/homescreen/homescree.dart';

class OrderController extends GetxController {
  var orders = <Datum1>[].obs;
  Future<void> updateOrderQuantity(int orderId, int newQuantity) async {
    final url = Uri.parse(
        'https://task.focal-x.com/api/orders/$orderId?quantity=$newQuantity');
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ConstData.access_token}',
    };

    try {
      final response = await http.put(url, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Quantity updated successfully: ${response.body}');
        Get.offAll(Homescree());
      } else {
        print('Failed to update quantity: ${response.body}');
      }
    } catch (e) {
      print('Error updating quantity: $e');
    }
    update();
  }

  Future<List<Map<String, dynamic>>> fetchOrders() async {
    final url = Uri.parse('https://task.focal-x.com/api/orders');
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ConstData.access_token}',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> data = jsonData['data'];
        return data
            .map((order) => {
                  'order_id': order['id'],
                  'product_id': order['peoduct']['id'],
                  'quantity': order['quantity'],
                  'product_name': order['peoduct']['name'],
                  'price': order['peoduct']['price'],
                  'image': order['peoduct']['image'],
                })
            .toList();
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<void> createOrder(List<Datum1> cartItems) async {
    final url = Uri.parse('https://task.focal-x.com/api/orders');
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ConstData.access_token}',
      'Content-Type': 'application/json',
    };

    try {
      for (var item in cartItems) {
        final orderData = {
          'product_id': item.id,
          'quantity': item.quantity,
        };

        final response = await http.post(
          url,
          headers: headers,
          body: jsonEncode(orderData),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print('Order created successfully: ${response.body}');
        } else {
          print('Failed to create order: ${response.body}');
        }
      }
    } catch (e) {
      print('Error creating order: $e');
    }
  }

  Future<void> deleteOrder(int orderId) async {
    final url = Uri.parse('https://task.focal-x.com/api/orders/$orderId');
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ConstData.access_token}',
    };

    try {
      final response = await http.delete(url, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 204) {
        print('Order deleted successfully');
        Get.offAll(Homescree());
      } else {
        print('Failed to delete order: ${response.body}');
      }
    } catch (e) {
      print('Error deleting order: $e');
    }
  }
}
