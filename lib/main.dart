import 'package:fci_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FCI App',
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        OnboardingScreen.id: (context) => const OnboardingScreen(),
        SplashScreen.id: (context) => const SplashScreen(nextScreen: SizedBox()),
        LoginScreen.id: (context) =>  LoginScreen(),
        
      },
      home: FutureBuilder<bool>(
        future: _checkFirstRun(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen(nextScreen: SizedBox());
          } else {
            final bool isFirstRun = snapshot.data ?? true;
            return SplashScreen(
                nextScreen: isFirstRun ? const OnboardingScreen() :  LoginScreen());
          }
        },
      ),
    );
  }

  Future<bool> _checkFirstRun() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isFirstRun = prefs.getBool('isFirstRun') ?? true;
    if (isFirstRun) {
      await prefs.setBool('isFirstRun', false);
    }
    return isFirstRun;
  }
}
