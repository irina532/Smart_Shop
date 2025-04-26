import 'package:get/get.dart';
import 'package:smart_shop/app/data/models/electronics_model.dart';

class ElectronicsController extends GetxController {
  // RxList to observe changes in the UI
  final electronicsList = <ElectronicsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchElectronicsProducts();
  }

  void fetchElectronicsProducts() {
    final List<Map<String, dynamic>> data = [
      {
        "id": 9,
        "title": "WD 2TB Elements Portable External Hard Drive - USB 3.0 ",
        "price": 64,
        "description": "USB 3.0 and USB 2.0 Compatibility Fast data transfers...",
        "category": "electronics",
        "image": "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
        "rating": {"rate": 3.3, "count": 203}
      },
      {
        "id": 10,
        "title": "SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s",
        "price": 109,
        "description": "Easy upgrade for faster boot up, shutdown, application load...",
        "category": "electronics",
        "image": "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
        "rating": {"rate": 2.9, "count": 470}
      },
      {
        "id": 11,
        "title": "Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5",
        "price": 109,
        "description": "3D NAND flash are applied to deliver high transfer speeds...",
        "category": "electronics",
        "image": "https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg",
        "rating": {"rate": 4.8, "count": 319}
      },
      {
        "id": 12,
        "title": "WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive",
        "price": 114,
        "description": "Expand your PS4 gaming experience, Play anywhere...",
        "category": "electronics",
        "image": "https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_.jpg",
        "rating": {"rate": 4.8, "count": 400}
      },
      {
        "id": 13,
        "title": "Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin",
        "price": 599,
        "description": "21.5 inches Full HD (1920 x 1080) widescreen IPS display...",
        "category": "electronics",
        "image": "https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg",
        "rating": {"rate": 2.9, "count": 250}
      },
      {
        "id": 14,
        "title": "Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor",
        "price": 999.99,
        "description": "49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR...",
        "category": "electronics",
        "image": "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
        "rating": {"rate": 2.2, "count": 140}
      }
    ];

    electronicsList.value = data.map((item) => ElectronicsModel.fromJson(item)).toList();
  }
}
