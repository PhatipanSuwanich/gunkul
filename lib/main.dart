import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunkul/screen/home/home.dart';
import 'package:gunkul/screen/login/login.dart';
import 'package:gunkul/secure_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final loginController = Get.put(LoginController());

  final id = await SecureStore().getUserSecureStore();

  runApp(GetMaterialApp(home: id == null ? LoginView() : Home()));
}

// class Product {
//   final String name;
//   final String imageUrl;
//   final double price;
//
//   Product({required this.name, required this.imageUrl, required this.price});
// }
//
// class ProductController extends GetxController {
//   final RxList<Product> products = RxList<Product>([]);
//
//   @override
//   void onInit() {
//     fetchProducts();
//     super.onInit();
//   }
//
//   void fetchProducts() async {
//     final response = await BaseService().getHttps('https://dummyjson.com/products');
//
//     if (response.statusCode == 200) {
//       final jsonData = response.data;
//       final productsData = jsonData['data'] as List<dynamic>;
//
//       final products = productsData
//           .map(
//             (product) => Product(
//               name: product['name'],
//               imageUrl: product['imageUrl'],
//               price: product['price'].toDouble(),
//             ),
//           )
//           .toList();
//
//       this.products.assignAll(products);
//     } else {
//       Get.snackbar('Error', 'Failed to fetch products');
//     }
//   }
// }
//
// class ProductScreen extends StatelessWidget {
//   final ProductController productController = Get.find<ProductController>();
//
//   ProductScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Products')),
//       body: Obx(
//         () => ListView.builder(
//           itemCount: productController.products.length <= 6 ? productController.products.length : 6,
//           itemBuilder: (context, index) {
//             final product = productController.products[index];
//             return ListTile(
//               leading: Image.network(product.imageUrl),
//               title: Text(product.name),
//               subtitle: Text('Price: \$${product.price.toStringAsFixed(2)}'),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
