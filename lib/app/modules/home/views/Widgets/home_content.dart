import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/app/modules/home/controllers/home_controller.dart';
import 'package:smart_shop/app/routes/app_pages.dart';

class HomeContent extends GetView<HomeController> {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.ALL_PRODUCTS);
                            },
                            child: const Text('View all'),
                          ),
                        ],
                      ),
                    ),

                    // Category List Horizontal
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.dummyCategoryList.length,
                        itemBuilder: (context, index) {
                          final product = controller.dummyCategoryList[index];
                          return InkWell(
                            onTap: () async {
                              await controller.mFetchCategoryProducts(product);
                              Get.toNamed(Routes.CATEGORY_PRODUCTS);
                            },
                           child: Container(
  padding: const EdgeInsets.all(8),
  margin: const EdgeInsets.symmetric(horizontal: 8),
  decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(10),
  ),
  child: Center(
    child: SingleChildScrollView( // Wrapping the Column with SingleChildScrollView
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensures the text doesn't overflow
        children: [
          // Ensure the image URL is a valid String
          Image.asset(
            product["imageUrl"] as String, // Explicitly casting to String
            height: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            product["name"].toString(),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
  ),
),



                          );
                        },
                      ),
                    ),

                    // Popular Products header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Popular Products', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.ALL_PRODUCTS);
                            },
                            child: const Text('View all'),
                          ),
                        ],
                      ),
                    ),

                    // Products Grid
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                        shrinkWrap: true, // VERY IMPORTANT
                        physics: const NeverScrollableScrollPhysics(), // VERY IMPORTANT
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
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
                                      errorBuilder: (_, __, ___) => const Icon(Icons.error),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    product.title,
                                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(product.rating?.rate.toString() ?? '0'),
                                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
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
                    ),
                  ],
                ),
              )),
      ),
    );
  }
}
