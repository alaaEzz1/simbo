import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simbo/presentation/screens/home_screen.dart';
import 'package:simbo/presentation/screens/login_screen.dart';
import 'package:simbo/presentation/screens/signup_screen.dart';
import 'package:simbo/presentation/screens/welcome_screen.dart';

void main() async {
  //this application is for Fitness Tracker and Planner App
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value){
    print("Firebase Intialized ${value.name}");
  });
  await testFirebaseAuth();
  runApp(const MyApp());
}

Future<void> testFirebaseAuth() async {
  await FirebaseAuth.instance.authStateChanges().first;
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker App',
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.welcomeRouteName,
      //route like navigation in native
      routes: {
        WelcomeScreen.welcomeRouteName: (context) => const WelcomeScreen(),
        HomeScreen.homeRouteName: (context) => const HomeScreen(),
        LoginScreen.loginRouteName: (context) => const LoginScreen(),
        SignUpScreen.signupRouteName: (context) => const SignUpScreen(),
      },
    );
  }
}
