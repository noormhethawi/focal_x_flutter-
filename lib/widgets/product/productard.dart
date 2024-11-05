// بطاقة المنتج
import 'package:flutter/material.dart';

class ProductCarde extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const ProductCarde({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(30), // نفس نصف القطر المستخدم في الحاوية
      child: Container(
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(imageUrl, height: 100),
                  SizedBox(height: 5),
                  Text(
                    'BEST SELLER',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Raleway',
                          fontSize: 14,
                          color: Color(0xFF6A6A6A))),
                  SizedBox(height: 5),
                  Text(price, style: TextStyle(color: Colors.black)),
                  Spacer(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: -10,
              left: 105,
              top: 170,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(30, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.all(8), // التحكم في المسافة داخل الزر
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0,
                      top: 0.0,
                      right: 3), // تحريك الأيقونة داخل الزر
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              top: -8,
              left: -8,
              child: IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.red),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
