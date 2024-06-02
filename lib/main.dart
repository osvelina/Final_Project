

import 'package:final_camp/Product.dart';
import 'package:final_camp/Profil.dart';
import 'package:final_camp/controller/auth_controller.dart';
import 'package:final_camp/firebase_options.dart';
import 'package:final_camp/loginpage.dart';
import 'package:final_camp/navigation_bar.dart';
import 'package:final_camp/splash.screan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp( MyApp());
}

void setup() {
  Get.put(AuthController()); 
}
class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        print(snapshot);
          return GetMaterialApp(
            title: 'Flutter Demo',
            home: SplashScreen(),
          );
        },
    );
  }
}
