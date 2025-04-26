import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_shop/app/data/models/product_model.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var categoryProducts = <ProductModel>[].obs;
  final String catProductBaseUrl = "https://fakestoreapi.com/products/category/";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final dummyCategoryList = [
    {"id": "electronics", "name": "Electronics", "imageUrl": "asset/images/electronics.png"},
    {"id": "jewelery", "name": "Jewelery", "imageUrl": "asset/images/jwellery.png"},
    {"id": "men's clothing", "name": "Men's clothing", "imageUrl": "asset/images/men.png"},
    {"id": "women's clothing", "name": "Women's clothing", "imageUrl": "asset/images/women.png"},
  ];

  Map<String, dynamic> selectedCategoryProudct = {};

  final RxList<String> localImages = <String>[
    'asset/images/jwellery.png',
    'asset/images/electronics.png',
    'asset/images/men.png',
    'asset/images/women.png',
  ].obs;

  final count = 0.obs;
  String test = 'hii';

  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  

  // Initialize the categories here
  dummyCategoryList.assignAll([
    {"id": "electronics", "name": "Electronics", "imageUrl": "asset/images/electronics.png"},
    {"id": "jewelery", "name": "Jewelery", "imageUrl": "asset/images/jwellery.png"},
    {"id": "men's clothing", "name": "Men's clothing", "imageUrl": "asset/images/men.png"},
    {"id": "women's clothing", "name": "Women's clothing", "imageUrl": "asset/images/women.png"},
  ]);


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
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> mFetchCategoryProducts(Map<String, String> product) async {
    selectedCategoryProudct = product;
    print('Selected category: ${product["name"]}');
    var response = await http.get(
      Uri.parse(catProductBaseUrl + product["id"].toString()),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      categoryProducts.value = data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      Logger().e('Failed to load category products: ${response.statusCode}');
    }
  }
}
