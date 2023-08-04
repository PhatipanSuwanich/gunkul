import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunkul/model/user_model.dart';
import 'package:gunkul/screen/home/home_view.dart';
import 'package:gunkul/secure_store.dart';
import 'package:gunkul/service/base_service.dart';

class LoginController extends GetxController {
  final Rx<UserModel?> user = Rx<UserModel?>(null);

  void callAPILogin(String email, String password) async {
    await BaseService().postHttps(
      'https://dummyjson.com/auth/login',
      body: {'username': email, 'password': password},
    ).then((result) {
      SecureStore().setUserSecureStore(result["id"].toString());
      callAPIUser();
    });

    Get.offAll(() => HomeView());
  }

  @override
  void onInit() {
    callAPIUser();
    super.onInit();
  }

  void callAPIUser() async {
    final id = await SecureStore().getUserSecureStore();
    if (id != null) {
      await BaseService().getHttps('https://dummyjson.com/users/${id}').then((result) {
        user.value = UserModel.fromJson(result);
      });
    }
  }
}

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController userController = Get.find<LoginController>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    emailController.text = "kminchelle";
    passwordController.text = "0lelplR";

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                userController.callAPILogin(emailController.text, passwordController.text);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
