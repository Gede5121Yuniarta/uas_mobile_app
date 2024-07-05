import 'package:flutter/material.dart';
import 'package:flutter_user_login/widget/dynamic_drawer.dart';

class Home extends StatelessWidget {
  final String userType;
  final String userName;
  final String userEmail;

  const Home({super.key, required this.userType, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      drawer: DynamicDrawer(userType: userType, userName: userName, userEmail: userEmail),
      body: Center(
        child: Text('Welcome to the homepage! UserType: $userType, UserName: $userName, UserEmail: $userEmail'),
      ),
    );
  }
}