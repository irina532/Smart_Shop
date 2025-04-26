import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jwelery_controller.dart';

class JweleryView extends GetView<JweleryController> {
  const JweleryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JweleryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'JweleryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
