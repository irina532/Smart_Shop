import 'package:get/get.dart';

import '../controllers/jwelery_controller.dart';

class JweleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JweleryController>(
      () => JweleryController(),
    );
  }
}
