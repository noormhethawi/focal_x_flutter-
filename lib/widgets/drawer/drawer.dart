import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/view/slidemenu/slidemenu.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => SideMenu());
      },
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            width: 17,
            height: 3,
            margin: EdgeInsets.only(right: 2),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            width: 20,
            height: 3,
            margin: EdgeInsets.only(right: 5),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue,
            ),
            width: 13,
            height: 3,
            margin: EdgeInsets.only(
              right: 12,
            ),
          )
        ],
      ),
    );
  }
}
