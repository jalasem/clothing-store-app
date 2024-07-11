import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:product_demo/app_controller.dart';
import 'package:product_demo/models/product.dart';
import 'package:product_demo/widgets/cart_indicator.dart';
import 'package:product_demo/widgets/product.dart';

class ProductsPageController extends GetxController {
  var isLoading = true.obs;

  final appController = Get.find<AppController>();

  @override
  void onInit() async {
    super.onInit();

    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final uri = Uri.https('fakestoreapi.com', '/products');
    final response = await http.get(uri);
    isLoading.value = false;

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final List<dynamic> body = jsonDecode(response.body);

      for (var product in body) {
        appController.products.add(Product.fromJson(product));
      }
    } else {
      log('Failed to fetch products');
    }
  }
}

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final appController = Get.find<AppController>();
  final controller = Get.put(ProductsPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = controller.isLoading.value;
      final products = appController.products;

      if (isLoading) {
        return Center(
          child: RefreshProgressIndicator(),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.eco,
            color: Colors.green.shade600,
            size: 30,
          ),
          actions: [
            CartIndicator(),
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.blueGrey[50],
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: RefreshIndicator(
            onRefresh: controller.fetchProducts,
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemCount: products.length,
              itemBuilder: (context, index) => ProductTile(products[index]),
            ),
          ),
        ),
      );
    });
  }
}
