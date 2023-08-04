import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunkul/model/ProductsModel.dart';
import 'package:gunkul/service/base_service.dart';

class ProductsController extends GetxController {
  final products = Rx<ProductsModel?>(null);

  @override
  void onInit() {
    callAPIProducts();
    super.onInit();
  }

  void callAPIProducts() async {
    await BaseService().getHttps('https://dummyjson.com/products').then((result) {
      products.value = ProductsModel.fromJson(result);
    });
  }
}

class ProductsView extends StatelessWidget {
  ProductsView({Key? key}) : super(key: key);

  final productController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Obx(() {
        final products = productController.products.value!.products!;
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              leading: Image.network(
                product.images![0],
                width: 100,
              ),
              title: Text(product.title!),
              subtitle: Text('Price: \$${product.price!.toStringAsFixed(2)}'),
            );
          },
        );
      }),
    );
  }
}
