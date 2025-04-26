import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/products_by_category_controller.dart';

class ProductsByCategoryView extends StatelessWidget {
  const ProductsByCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String category = Get.parameters['category'] ?? 'Unknown';

    // Only initialize if not already initialized
    final controller = Get.put(ProductsByCategoryController(category));

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: GetBuilder<ProductsByCategoryController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.products.isEmpty) {
            return const Center(child: Text('No products found.'));
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          product.image,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => const Icon(Icons.error),
                        ),
                      ),
                      Text(
                        product.title,
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text('\$${product.price}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

