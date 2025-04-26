import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/app/modules/electronics/controllers/electronics_controller.dart';

class ElectronicsView extends GetView<ElectronicsController> {
  const ElectronicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electronics Products'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.electronicsList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemCount: controller.electronicsList.length,
            itemBuilder: (context, index) {
              final product = controller.electronicsList[index];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (_, __, ___) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.title,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$${product.price}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Text(product.rating?.rate.toString() ?? '0.0'),
                              const Icon(Icons.star, color: Colors.yellow, size: 16),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
