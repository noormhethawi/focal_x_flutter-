import 'package:flutter/material.dart';

class MyShopBag extends StatelessWidget {
  const MyShopBag({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none, // للسماح للعناصر بالخروج من حدود الـ Stack
        children: [
          InkWell(
            onTap: () {
              // هنا يمكنك وضع الكود الذي يأخذك إلى المسار المطلوب
              // على سبيل المثال، التنقل إلى شاشة جديدة:
              print("تم الضغط على أيقونة المحفظة");
            },
            child: ClipOval(
              child: Container(
                color: Colors.white, // لون خلفية الأيقونة
                padding: EdgeInsets.all(1.0), // إضافة بعض المسافة حول الصورة
                child: Image.asset(
                  'assets/storeimage.png', // المسار إلى الصورة
                  width: 40, // العرض المطلوب للأيقونة
                  height: 85, // الارتفاع المطلوب للأيقونة
                ),
              ),
            ),
          ),
          // الدائرة الحمراء
          Positioned(
            right: 0, // الموقع الأفقي للدائرة بالنسبة للصورة
            top: 0, // الموقع العمودي للدائرة بالنسبة للصورة
            child: Container(
              width: 10, // العرض المطلوب للدائرة
              height: 10, // الارتفاع المطلوب للدائرة
              decoration: BoxDecoration(
                color: Colors.red, // لون الدائرة
                shape: BoxShape.circle, // جعل الـ Container دائري
              ),
            ),
          ),
        ],
      ),
    );
  }
}
