import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_shop/app/modules/all_categories/views/all_categories_view.dart';
import 'package:smart_shop/app/modules/all_products/views/all_products_view.dart';
import 'package:smart_shop/app/modules/cart/views/cart_view.dart';
import 'package:smart_shop/app/modules/home/views/Widgets/custom_drawer_implementation.dart';
import 'package:smart_shop/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
   double scrHeight =  MediaQuery.of(context).size.height;
      double scrWidth =  MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        

   
        
        actions: [
          const Text('Erina'),
          const SizedBox(width: 20),
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
            child: ClipOval(
              child: Image.network(
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw3_7NaSQYYu7uvsU_32mKmv1zqYc3AbjAtw&s",
  fit: BoxFit.contain,
  width: 50,
  height: 50,
  errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(),
    );
  },
),

            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
       drawer: CustomDrawer(),
      body: Column(
        children: [
          // Row with the category and view all text button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child:
                // Category
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.ALL_PRODUCTS);
                  },
                  child: const Text('View all'),
                ),
              ],
            ),
          ),
          // ListView.builder to display items horizontally
          Obx(() => Container(
  height: 100,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: controller.products.length,
    itemBuilder: (context, index) {
      return Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Image.network(
          controller.products[index].image,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Icon(Icons.error),
          loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null ? child : CircularProgressIndicator(),
        ),
      );
    },
  ),
)),


          // Popular products
Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Products',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                     Get.toNamed(Routes.ALL_PRODUCTS);
                  },
                  child: const Text('View all'),
                ),
              ],
            ),
          ),
          //
   Expanded(
  child: Obx(() => GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemCount: controller.products.length,
    itemBuilder: (context, index) {
      final product = controller.products[index];
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Icon(Icons.error),
                ),
              ),
              Text(
                product.title,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(product.rating?.rate.toString() ?? '0'),
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${product.price}'),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                      ),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 16),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    },
  )),
   )],),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Index of the currently selected tab
        onTap: (index) {
          // Handle tap actions here
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
        ],
      ),
    );
  }
}

