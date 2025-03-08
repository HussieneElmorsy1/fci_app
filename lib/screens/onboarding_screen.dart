import 'package:fci_app/screens/home_screen.dart';
import 'package:fci_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String id = "OnboardingScreen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == (5 - 1);
            });
          },
          children: [
            Container(
              color: Colors.red,
              child: const Center(child: Text("Page 1")),
            ),
            Container(
              color: Colors.yellow,
              child: const Center(child: Text("Page 2")),
            ),
            Container(
              color: Colors.black,
              child: const Center(child: Text("Page 3")),
            ),
            Container(
              color: Colors.blue,
              child: const Center(child: Text("Page 4")),
            ),
            Container(
              color: Colors.pink,
              child: const Center(child: Text("Page 5")),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size.fromHeight(80),
              ),
              onPressed: () async {
                // navigate to the home screen
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool("showHome", true);
                Navigator.pushReplacementNamed(context, LoginScreen.id);
              },
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 24),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.jumpToPage(4),
                    child: const Text("SKIP"),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                        controller: controller, // PageController
                        count: 5,
                        effect: const JumpingDotEffect(
                          dotColor: Color(0xFF0C8CE9),
                          activeDotColor: Color(0xFF0C8CE9),
                          spacing: 16.0,
                          paintStyle: PaintingStyle.stroke,
                        ), // your preferred effect
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut)),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: const Text("NEXT"),
                  ),
                ],
              ),
            ),
    );
  }
}
