import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simbo/presentation/screens/home_screen.dart';
import 'package:simbo/presentation/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const welcomeRouteName = "welcome screen";

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

//TickerProviderStateMixin to provide the necessary ticker for our AnimationController.
class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );

    _opacityAnimation = Tween<double>(
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

  @override
  Widget build(BuildContext context) {
    //hides the system UI elements like the status bar and navigation bar
    //to provide a more immersive experience.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return Scaffold(
      backgroundColor: Colors.grey[150],
      body: FadeTransition(
        opacity: _opacityAnimation,
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Column(
                  children: [
                    const FlutterLogo(
                      size: 100,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Welcome To Simbo",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, LoginScreen.loginRouteName);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.homeRouteName);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Continue as a Guest",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
