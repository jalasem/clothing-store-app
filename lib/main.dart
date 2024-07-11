import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_demo/app_controller.dart';
import 'package:product_demo/pages/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ),
      ),
      initialRoute: '/products',
      getPages: [
        GetPage(name: '/products', page: () => ProductsPage()),
      ],
    );
  }
}
