import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:gunkul/main.dart';
import 'package:gunkul/screen/login/login_view.dart';
import 'package:gunkul/screen/products/products_view.dart';
import 'package:gunkul/secure_store.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final loginController = Get.put(ProductsController());
  final LoginController userController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
            ),
            onPressed: () {
              SecureStore().deleteUser();
              Get.off(LoginView());
            },
          ),
        ],
      ),
      body: Obx(
        () => userController.user.value != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Id: ${userController.user.value!.id}'),
                    Text(
                        'Name: ${userController.user.value!.firstName} ${userController.user.value!.lastName}'),
                    Text('Email: ${userController.user.value!.email}'),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => ProductsView());
                      },
                      child: const Text('Products'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (Get.isDarkMode) {
                          Get.changeTheme(ThemeData.light());
                          SecureStore().setThemeSecureStore(ThemeContent.light.toString());
                        } else {
                          Get.changeTheme(ThemeData.dark());
                          SecureStore().setThemeSecureStore(ThemeContent.dark.toString());
                        }
                      },
                      child: const Text('Theme'),
                    ),
                  ],
                ),
              )
            : const SpinKitWave(
                color: Colors.blueAccent,
                size: 70.0,
              ),
      ),
    );
  }
}
