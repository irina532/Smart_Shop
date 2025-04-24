import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_shop/app/data/models/cart_model.dart';

class AllCartsController extends GetxController {
  //TODO: Implement AllCartsController
  var isLoading = true.obs;
  var CartList = <CartModel>[].obs;
  final allCartsUrl ="https://fakestoreapi.com/carts?userId=1";

  final count = 0.obs;
  @override
  void onInit() {
    print("Calling");
    fetchCarts();
    super.onInit();
  }

   fetchCarts() async{
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(allCartsUrl));
     print("Response: ${response.body}");
     
      if(response.statusCode == 200) {
        List<dynamic> carts = json.decode(response.body);
        print("response is working");

        for(var i =0; i<carts.length; i++){
          CartModel cartModelObject = CartModel.fromJson(carts[i]);
          CartList.add(cartModelObject);
        }
      }else{
        Get.snackbar("Error", "Failed to fetch carts");
      }
    } catch (e){
      Get.snackbar("Error", e.toString());
    } finally{
      isLoading.value = false;
      print(CartList.length);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
