import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_demo/app_controller.dart';
import 'package:product_demo/constants.dart';
import 'package:product_demo/models/product.dart';
import 'package:product_demo/pages/product_detail.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile(this.product);

  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            appController.productInViewId.value = product.id;
            Get.to(ProductDetailPage());
          },
          child: Card(
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(product.image,
                  height: 140, fit: BoxFit.contain),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  ...List.generate(
                      product.rating.round(),
                      (i) => Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 15,
                          )),
                  const SizedBox(width: 5),
                  Text(
                    '${product.rating}',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                product.title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              Text(
                product.category.capitalize!,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$${product.price}',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.deepAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  appController.addToCart(product);
                },
                child: Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
