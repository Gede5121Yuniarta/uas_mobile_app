import 'package:flutter/material.dart';
import 'package:flutter_user_login/screens/home.dart';
import 'package:flutter_user_login/widget/login_scree.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userType = prefs.getString('userType');
    String? userName = prefs.getString('userName');
    String? userEmail = prefs.getString('userEmail');

    if (token != null && userType != null && userName != null && userEmail != null) {
      // Navigate to Homepage based on userType
      if (userType == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(userType: 'admin', userName: userName, userEmail: userEmail)),
        );
      } else if (userType == 'super admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(userType: 'super admin', userName: userName, userEmail: userEmail)),
        );
      } else if (userType == 'user') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(userType: 'user', userName: userName, userEmail: userEmail)),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}