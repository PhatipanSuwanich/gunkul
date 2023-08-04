import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:gunkul/screen/login/login.dart';
import 'package:gunkul/secure_store.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

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
                        // Get.to(() => ProductScreen());
                      },
                      child: const Text('Products'),
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
