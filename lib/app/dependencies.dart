import 'package:fullstacktask/controller/home_controller.dart';
import 'package:get/get.dart';


Future<void> initApp() async {
  Get.lazyPut(() => HomeController());

}