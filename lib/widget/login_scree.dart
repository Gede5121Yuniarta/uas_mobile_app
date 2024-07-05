import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_user_login/model/user_model.dart';
import 'package:flutter_user_login/screens/home.dart';
import 'package:flutter_user_login/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  Duration get loginTime => const Duration(milliseconds: 2250);
  Future<String?> _authUser(BuildContext context, LoginData data) async {
    try {
      final UserDTO user = await ApiService.login(data);
      // tambahkan shared preference untuk menyimpan login
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', user.token?? '');
      prefs.setString('userType', user.type?? '');
      prefs.setString('userName', user.name?? '');
      prefs.setString('userEmail', user.email?? '');

      if (user.type == 'admin') {
        if (user.name!= null && user.email!= null) {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Home(userType: 'admin', userName: user.name!, userEmail: user.email!)),
          );
        } else {
          // Handle the case where user.name or user.email is null
          return 'User name or email is null';
        }
      } else if (user.type == 'uper admin') {
        if (user.name!= null && user.email!= null) {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home(userType: 'uper admin', userName: user.name!, userEmail: user.email!)),
          );
        } else {
          // Handle the case where user.name or user.email is null
          return 'User name or email is null';
        }
      } else if (user.type == 'user') {
        if (user.name!= null && user.email!= null) {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home(userType: 'user', userName: user.name!, userEmail: user.email!)),
          );
        } else {
          // Handle the case where user.name or user.email is null
          return 'User name or email is null';
        }
      } else {
        // Login gagal
        return 'Login failed';
      }
    } catch (e) {
      // Tangani kesalahan
      print(e);
      return 'An error occurred: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Login',
      onLogin: (data) => _authUser(context, data),
      onSignup: (_) => Future.delayed(loginTime),
      onSubmitAnimationCompleted: () {},
      onRecoverPassword: (String) {},
    );
  }
}