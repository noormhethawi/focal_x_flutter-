import 'package:get/get.dart';
import 'package:pro/core/const_data/app_colors.dart';
import 'package:pro/core/service/routes.dart';
import 'package:pro/view/cart/explorescreen.dart';
import 'package:pro/view/homescreen/homescree.dart';
import 'package:pro/view/notification/controller/notification_controller.dart';

import 'package:flutter/material.dart';
//import 'package:get/get_state_manager/src/simple/get_state.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //  automaticallyImplyLeading: false,
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        title: Text(
          "Notifications",
          textAlign: TextAlign.center,
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Raleway',
            height: 0,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.delete),
          )
        ],
      ),

      // body: GetBuilder<NotificationController>(
      //   init: NotificationController(),
      //   builder: (controller) {
      //     return Scaffold(
      //       body: Center(
      //         child: Padding(
      //           padding: const EdgeInsets.only(
      //             top: 80,
      //             left: 20,
      //             right: 20,
      //           ),
      //           child: Column(
      //             children: [
      //               const Text(
      //                 "Notification Page",
      //                 style: TextStyle(
      //                   color: ColorManger.white,
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 33,
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 80,
      //               ),

      //               const SizedBox(height: 20),
      //               Obx(() => Expanded(
      //                     child: ListView.builder(
      //                       itemCount: controller.notificationsList.length,
      //                       itemBuilder: (context, index) {
      //                         return ListTile(
      //                           title:
      //                               Text(controller.notificationsList[index]),
      //                         );
      //                       },
      //                     ),
      //                   )),
      //             ],
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
