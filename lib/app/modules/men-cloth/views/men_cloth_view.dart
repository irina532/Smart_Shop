import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/men_cloth_controller.dart';

class MenClothView extends GetView<MenClothController> {
  const MenClothView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MenClothView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MenClothView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
