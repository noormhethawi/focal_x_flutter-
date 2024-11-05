import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pro/view/notification/screen/notification_screen.dart';
import '../sign_in/control/signin_control.dart';
import '/view/favorite/favoritescreen.dart';
import '/view/my_cart/cart_screen.dart';
import '/view/order/ordercontroller.dart';
import '/view/profile/profilescreen.dart';
import '/view/order/orderscreen.dart';
import '/view/profile/profileimage.dart';

class SideMenu extends StatelessWidget {
  final ImageController imageController = Get.put(ImageController());
  final SigninControl signincontroll = Get.put(SigninControl());

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.find<OrderController>();

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: Text('Menu'),
      ),
      body: Container(
        color: Colors.black87,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Obx(
              () => UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
                accountName: Text(
                  imageController.name.value,
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: null,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: imageController.selectedImage.value != null
                      ? FileImage(imageController.selectedImage.value!)
                      : NetworkImage('https://example.com/default_image.jpg')
                          as ImageProvider,
                ),
              ),
            ),
            _buildDrawerItem(Icons.person, 'Profile', () {
              Get.to(() => ProfileScreen());
            }),
            _buildDrawerItem(Icons.shopping_cart, 'My Cart', () {
              Get.to(() => CartScreen());
            }),
            _buildDrawerItem(Icons.favorite, 'Favorite', () {
              Get.to(() => Favoritescreen());
            }),
            _buildDrawerItem(Icons.list_alt, 'Orders', () async {
              final orders = await orderController.fetchOrders();
              Get.to(() => OrderScreen(orders: orders));
            }),
            _buildDrawerItem(Icons.notifications, 'Notifications', () {
              Get.to(() => NotificationScreen());
            }),
            _buildDrawerItem(Icons.settings, 'Settings', () {}),
            Divider(color: Colors.white70),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.white),
              title: Text('Sign Out', style: TextStyle(color: Colors.white)),
              onTap: () {
                signincontroll.Logout();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway',
              fontSize: 16,
              fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.chevron_right, color: Colors.white),
      onTap: onTap,
    );
  }
}
