import 'package:flutter/material.dart';
import 'package:flutter_user_login/screens/list_screen.dart';
// import 'package:flutter_user_login/widget/login_scree.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DynamicDrawer extends StatelessWidget {
  final String userType;
  final String userName;
  final String userEmail;

  DynamicDrawer({super.key, required this.userType, required this.userName, required this.userEmail});

  Future<void> _logout(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('userType');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ListScreen()),
        );
      });
    } catch (e) {
      // Handle the error
      print('Error logging out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              // Navigate to profile screen
            },
          ),
          if (userType == 'admin')
            ListTile(
              title: const Text('Admin Feature'),
              onTap: () {
                // Navigate to admin feature screen
              },
            ),
            if (userType == 'super admin')
            ListTile(
              title: const Text('Super Admin Feature'),
              onTap: () {
                // Navigate to admin feature screen
              },
            ),
          ListTile(
            title: const Text('Logout'),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}