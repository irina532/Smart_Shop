import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/womens_cloth_controller.dart';

class WomensClothView extends GetView<WomensClothController> {
  const WomensClothView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WomensClothView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WomensClothView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
