import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_demo/app_controller.dart';

class CartIndicator extends StatelessWidget {
  final appController = Get.find<AppController>();

  @override
  build(BuildContext context) {
    return Obx(() {
      final cartCount = appController.cart.length;

      return Stack(
        children: [
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey.shade900,
            ),
            onPressed: () {
              // go to cart page
            },
          ),
          Positioned(
            right: 8,
            top: 3,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                cartCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
