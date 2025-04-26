import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/app/modules/home/controllers/home_controller.dart';

class ProductsByCategoryView extends GetView<HomeController> {
  const ProductsByCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final String category = Get.parameters['category'] ?? '';
    final products = controller.getProductsByCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.capitalizeFirst ?? 'Category'),
      ),
      body: products.isEmpty
          ? const Center(child: Text('No products found.'))
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
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
                            errorBuilder: (_, __, ___) => const Icon(Icons.error),
                          ),
                        ),
                        Text(
                          product.title,
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(product.rating?.rate.toString() ?? '0'),
                            const Icon(Icons.star, color: Colors.yellow, size: 16),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$${product.price}'),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                ),
                              ),
                              child: const Icon(Icons.add, color: Colors.white, size: 16),
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
}
