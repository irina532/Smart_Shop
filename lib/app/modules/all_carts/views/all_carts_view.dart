import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_carts_controller.dart';

class AllCartsView extends GetView<AllCartsController> {
  const AllCartsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Carts"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.CartList.isEmpty) {
          return const Center(child: Text("No carts available"));
        }

        return ListView.builder(
          itemCount: controller.CartList.length,
          itemBuilder: (context, index) {
            final cart = controller.CartList[index];

            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: Text("Cart ID: ${cart.id}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User ID: ${cart.userId}"),
                    Text("Total Products: ${cart.products.length}"),
                  ],
                ),
                

                
              ),
            );
          },
        );
      }),
    );
  }
}