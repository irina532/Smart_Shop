import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_shop/app/data/models/product_model.dart';
import 'dart:convert';

class HomeController extends GetxController {
  final count = 0.obs;
  String test = 'hii';

  // List of products from API
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void increment() => count.value++;

  void fetchProducts() async {
    try {
      final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        products.value = data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        print('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}
