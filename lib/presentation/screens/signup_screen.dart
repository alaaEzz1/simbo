import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simbo/presentation/screens/login_screen.dart';


class SignUpScreen extends StatefulWidget {
  static const signupRouteName = "signup_screen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isRegistering = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 1,
        ));
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ));
    return;
  }

  Future<void> _signup() async {
    // empty fields validation
    if (fullNameController.text.isEmpty) {
      showSnackBar("Full Name is required");
    } else if (emailController.text.isEmpty) {
      showSnackBar("Email is required");
    } else if (passwordController.text.isEmpty) {
      showSnackBar("Password is required");
    } else if (weightController.text.isEmpty) {
      showSnackBar("Weight is required");
    } else if (heightController.text.isEmpty) {
      showSnackBar("Height is required");
    } else {
      try {

        setState(() {
          _isRegistering = true;
        });

        final UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        await _firestore.collection("users").doc(userCredential.user!.uid).set({
          "Full_Name": fullNameController.text,
          "Email": emailController.text,
          "Password": passwordController.text,
          "Weight": weightController.text,
          "Height": heightController.text,
        }).onError((error, stackTrace) {
          print("error in firestore ${error.toString()}");
        }).then((value) {
          print("task is complete");
          showSnackBar("Account created Successfully");
          // Navigate to the login screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        });
      } catch (e) {
        //showSnackBar(e.toString());
        print("catch error ${e.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Create New Account"),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 24, color: Colors.redAccent),
                ),
                const SizedBox(
                  height: 20,
                ),
                if(_isRegistering)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: TextFormField(
                          controller: fullNameController,
                          style: const TextStyle(color: Colors.redAccent),
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            hintStyle: const TextStyle(color: Colors.redAccent),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 3,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: TextFormField(
                          controller: emailController,
                          style: const TextStyle(color: Colors.redAccent),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: const TextStyle(color: Colors.redAccent),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 3,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          style: const TextStyle(color: Colors.redAccent),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.redAccent),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 3,
                              ),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: TextFormField(
                          controller: weightController,
                          style: const TextStyle(color: Colors.redAccent),
                          decoration: InputDecoration(
                            hintText: "Weight",
                            hintStyle: const TextStyle(color: Colors.redAccent),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 3,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: TextFormField(
                          controller: heightController,
                          style: const TextStyle(color: Colors.redAccent),
                          decoration: InputDecoration(
                            hintText: "Height",
                            hintStyle: const TextStyle(color: Colors.redAccent),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                                width: 3,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: ElevatedButton(
                          onPressed: _signup,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent),
                          child: const Text(
                            'Create New Account...',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context,
                              LoginScreen
                                  .loginRouteName); // Navigate to the signup screen
                        },
                        child: const Text(
                          'Already have an account? Log in',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
