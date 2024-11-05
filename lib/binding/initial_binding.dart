import 'package:get/get.dart';
import 'package:pro/view/0n_board_screens/control/p_control.dart';
import '/core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    //Get.put(HomeController());
  }
}
