import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:smart_shop/app/routes/app_pages.dart';



class LogInController extends GetxController {
  //TODO: Implement HomeController

  String testText = "This is a test text";
  RxInt counterValue = 0.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passtextEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// change the counter value ////
  mInreamentalMethod() {
    counterValue.value++;
    print(counterValue);
  }

  mDecreamentalMethod() {
    counterValue.value--;
    print(counterValue);
  }

  Future<void> mLogin() async {
  final email = emailtextEditingController.text.trim();
  final pass = passtextEditingController.text.trim();

  if (email.isEmpty || pass.isEmpty) {
    Get.snackbar("Input Error", "Email and password must not be empty");
    return;
  }

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );

    if (userCredential.user != null) {
      emailtextEditingController.clear();
      passtextEditingController.clear();
      Get.offAllNamed(Routes.HOME);
    }
  } catch (e, stackTrace) {
    Logger().w(stackTrace.toString());
    Get.snackbar("Login Failed", e.toString());
  }
}


  Future<void> mRegister({required String email, required String pass}) async {
  email = email.trim();
  pass = pass.trim();

  if (email.isEmpty || pass.isEmpty) {
    Get.snackbar("Input Error", "Email and password must not be empty");
    return;
  }

  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );

    if (userCredential.user != null) {
      Get.snackbar("Success", "Account created successfully");
      Get.offAllNamed(Routes.HOME);
    }
  } catch (e) {
    Get.snackbar("Register Failed", e.toString());
  }
}


  Future<void> mLogout() async {
    try {
      await _auth.signOut();
      Get.snackbar("Success", "Sign Out successfully");
      // Navigate or do other stuff here
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
