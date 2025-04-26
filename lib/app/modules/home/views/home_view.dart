import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:smart_shop/app/modules/all_products/views/all_products_view.dart';
import 'package:smart_shop/app/modules/cart/views/cart_view.dart';
import 'package:smart_shop/app/modules/home/views/Widgets/custom_drawer_implementation.dart';
import 'package:smart_shop/app/modules/home/views/Widgets/home_content.dart';
import 'package:smart_shop/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;

    // Add a new RxInt to track the selected tab
    final RxInt selectedIndex = 0.obs;

    // List of screens for each tab
    final List<Widget> screens = [
      HomeContent(), // <- move your current home page content here
      Center(child: Text('No Notifications')), // <- Notification screen
    ];

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

      // Body will change depending on selected index
      body: Obx(() => screens[selectedIndex.value]),

      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: selectedIndex.value,
        onTap: (index) {
          selectedIndex.value = index;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
        ],
      )),
    );
  }
}
