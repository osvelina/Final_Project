
import 'package:final_camp/loginpage.dart';
import 'package:final_camp/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  
  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => BottomNavigation());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'Tidak ada pengguna dengan email tersebut.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Password yang dimasukkan salah.';
      } else {
        errorMessage = 'Terjadi kesalahan saat login: ${e.message}';
      }
      Get.snackbar('Login Error', errorMessage, backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Login Error', 'Terjadi kesalahan saat login: $e', backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
     
      Get.offAll(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'Password is too weak';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = 'Error during sign up: ${e.message}';
      }
      Get.snackbar('Sign Up Error', errorMessage, backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Sign Up Error', 'Error during sign up: $e', backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
