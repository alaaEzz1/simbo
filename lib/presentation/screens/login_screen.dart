import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simbo/presentation/screens/signup_screen.dart';
import 'package:simbo/presentation/widgets/views/button.dart';
import 'package:simbo/presentation/widgets/views/text_form.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const loginRouteName = "login_screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaledAnimation;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _scaledAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCubic);

    _animationController.forward();
  }

  void showSnackBarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ));
    return;
  }

  void _login() async {
    try {
      if (emailController.text.isEmpty) {
        showSnackBarMessage("Email is Required");
      } else if (passwordController.text.isEmpty) {
        showSnackBarMessage("Password is Required");
      } else {
        final UserCredential? credential = await _auth
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        });
      }
    } catch (e) {
      print("login catching error ${e.toString()}");
      showSnackBarMessage("Email or Password is Wrong");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ScaleTransition(
            scale: _scaledAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 24, color: Colors.redAccent),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (isLogin)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  Column(
                    children: [
                      appTextForm(
                        hintTitle: "Email",
                        type: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      appTextForm(
                        hintTitle: "Password",
                        type: TextInputType.emailAddress,
                        controller: passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      appButtonStyle(title: "Login", function: _login),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context,
                              SignUpScreen
                                  .signupRouteName); // Navigate to the signup screen
                        },
                        child: const Text(
                          'Don\'t have an account? Sign up',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
