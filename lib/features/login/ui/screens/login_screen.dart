
import 'package:doctors_app/core/theming/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBlue,
        title: Text('Login Screen ', style: TextStyle(
          color: AppColors.mainWhite
        ),),
      ),
      body: Center(child: Text('Login screen working')),
    );
  }
}
