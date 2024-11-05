import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/view/homescreen/homescreencontroller.dart';
import '/widgets/custombuttonappbar/custombuttonappbar.dart';

class AppbarbuttonHome extends StatelessWidget {
  const AppbarbuttonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreencontrollerImp>(
      builder: (controller) => BottomAppBar(
        color: Color.fromARGB(255, 247, 246, 246),
        height: 75,
        shape: CircularNotchedRectangle(),
        notchMargin: 13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(controller.listpage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? Spacer()
                  : Expanded(
                      // Use Expanded to allow resizing
                      child: Custombuttonappbar(
                        icon: controller.bottomappbar[i],
                        onPressed: () {
                          controller.changePage(i);
                        },
                        active: controller.currentpage == i,
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }
}
