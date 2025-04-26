import 'package:get/get.dart';

import '../controllers/womens_cloth_controller.dart';

class WomensClothBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WomensClothController>(
      () => WomensClothController(),
    );
  }
}
