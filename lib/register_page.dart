import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'new_login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _emailEditingController;
  late final TextEditingController _passwordEditingController;
  late final TextEditingController _passwordAgainEditingController;

  @override
  void initState() {
    super.initState();

    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    _passwordAgainEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _passwordAgainEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 128),
                FlutterLogo(
                  size: 128,
                ),
                const SizedBox(height: 16),
                Text(
                  'Flutter Authentication',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: _emailEditingController,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      hintText: 'Enter your e-mail address here',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordEditingController,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      hintText: 'Enter your password here',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordAgainEditingController,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      hintText: 'Enter your password here again',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: MaterialButton(
                    onPressed: () async {
                      if (_passwordEditingController.value.text !=
                          _passwordAgainEditingController.value.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Passwords aren\'t matched!',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      debugPrint(_emailEditingController.value.text);
                      debugPrint(_passwordAgainEditingController.value.text);

                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _emailEditingController.value.text,
                        password: _passwordAgainEditingController.value.text,
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    color: Colors.blue,
                    height: 0,
                    minWidth: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Kayıt ekranına yönlendirme işlemleri burada gerçekleştirilebilir
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => NewLogin()),
                     );
                  },
                  child: Text('Have an account? Get in!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
