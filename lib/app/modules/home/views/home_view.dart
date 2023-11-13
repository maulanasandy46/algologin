import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.offNamed('/login');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(
          'Welcome',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
