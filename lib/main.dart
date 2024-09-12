import 'package:flutter/material.dart';
import 'package:planta/views/change_password_view.dart';

void main() {
  runApp(const Planta());
}

class Planta extends StatelessWidget {
  const Planta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text('Change Password'),
        ),
        body: const ChangePasswordView(),
      ),
    );
  }
}
