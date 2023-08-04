import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunkul/screen/home/home_view.dart';
import 'package:gunkul/screen/login/login_view.dart';
import 'package:gunkul/secure_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final loginController = Get.put(LoginController());

  final id = await SecureStore().getUserSecureStore();

  runApp(GetMaterialApp(home: id == null ? LoginView() : HomeView()));
}
