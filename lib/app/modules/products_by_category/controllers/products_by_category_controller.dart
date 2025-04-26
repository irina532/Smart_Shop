import 'package:get/get.dart';
import 'package:smart_shop/app/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsByCategoryController extends GetxController {
  final String category;
  var isLoading = true.obs;
  var products = <ProductModel>[].obs;

  ProductsByCategoryController(this.category); // assign constructor param

  @override
  void onInit() {
    super.onInit();
    fetchProductsByCategory();
  }

  void fetchProductsByCategory() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/$category'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        products.value = data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        print('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
