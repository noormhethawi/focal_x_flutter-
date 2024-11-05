import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/view/order/ordercontroller.dart';

class OrderScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders;

  OrderScreen({required this.orders});

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.find<OrderController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body: orders.isEmpty
          ? Center(
              child: Text(
                'No orders available.',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  color: Colors.grey[800],
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                        'https://task.focal-x.com/${order['image']}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.broken_image, color: Colors.white),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' ${order['product_name']}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Quantity: ${order['quantity']}  |  Price: \$${order['price']}',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            _showEditQuantityDialog(
                              context,
                              order['order_id'],
                              order['quantity'],
                              orderController,
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            final confirmDelete = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Confirm Delete'),
                                content: Text(
                                    'Are you sure you want to delete this order?'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: Text('Delete'),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                  ),
                                ],
                              ),
                            );

                            if (confirmDelete == true) {
                              await orderController
                                  .deleteOrder(order['order_id']);
                              await orderController.fetchOrders();
                              Get.snackbar(
                                'Deleted',
                                'Order ID ${order['order_id']} has been deleted',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _showEditQuantityDialog(BuildContext context, int orderId,
      int currentQuantity, OrderController orderController) {
    final TextEditingController quantityController = TextEditingController();
    quantityController.text = currentQuantity.toString();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Quantity'),
          content: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter new quantity'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final newQuantity =
                    int.tryParse(quantityController.text) ?? currentQuantity;
                await orderController.updateOrderQuantity(orderId, newQuantity);
                await orderController.fetchOrders();
                Navigator.of(context).pop();
                Get.snackbar(
                  'Success',
                  'Quantity updated to $newQuantity for Order ID $orderId',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
