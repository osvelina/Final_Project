import 'package:final_camp/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

 // Ganti dengan halaman tujuan setelah splash screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 7), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFFEA3A60),
      body: Center(
        child: Lottie.asset(
          'assets/Lottie/Animation - 1717309576556.json', 
          width: 250,
          height: 250,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
