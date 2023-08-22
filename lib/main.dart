import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_application/home_page.dart';
import 'package:login_application/login.dart';
import 'package:login_application/register_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Project());
}

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

