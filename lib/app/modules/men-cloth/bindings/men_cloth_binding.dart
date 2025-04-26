import 'package:get/get.dart';

import '../controllers/men_cloth_controller.dart';

class MenClothBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenClothController>(
      () => MenClothController(),
    );
  }
}
