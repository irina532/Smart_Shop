import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_shop/app/data/models/product_model.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Example in your HomeController
final categoryNames = [
  'jewelery',
  'electronics',
  'men\'s clothing',
  'women\'s clothing',
].obs;


  final RxList<String> localImages = <String>[
    'asset/images/jwellery.png',
    'asset/images/electronics.png',
    'asset/images/men.png',
    'asset/images/women.png',
  ].obs;
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

  Future<void> mLogout() async {
    try {
      await _auth.signOut();
      Get.snackbar("Success", "Sign Out successfully");
      // Navigate or do other stuff here
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
