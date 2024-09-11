import 'package:get/get.dart';
import 'package:project15/Controller/Quize_Controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => Quize_Controller());
  }
}