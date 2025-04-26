import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/app/modules/home/controllers/home_controller.dart';

class CategoryProductsView extends GetView<HomeController> {
  const CategoryProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String categoryName = controller.selectedCategoryProudct["name"] ?? "Category";

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.categoryProducts.isEmpty) {
          // Loading or no products
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemCount: controller.categoryProducts.length,
              itemBuilder: (context, index) {
                final product = controller.categoryProducts[index];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              product.image,
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) => const Icon(Icons.error),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              product.rating?.rate.toString() ?? "0.0",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
