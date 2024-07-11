import 'package:get/get.dart';
import 'package:product_demo/models/product.dart';

class AppController extends GetxController {
  var products = <Product>[].obs;
  var cart = <Product>[].obs;
  var productInViewId = 0.obs;

  void addToCart(Product product) {
    cart.add(product);
  }

  void removeFromCart(Product product) {
    cart.remove(product);
  }

  Product get productInView =>
      products.firstWhere((product) => product.id == productInViewId.value);
}
