import 'package:fci_app/screens/home_screen.dart';
import 'package:fci_app/widgets/custom_bottom.dart';
import 'package:fci_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  static const String id = "ForgotPasswordScreen";
  String? email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '2.1'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '2.2'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 32),
            CustomFormTextField(
              labelText: '1.2'.tr,
              helperText: '1.4'.tr,
              keyboardType: TextInputType.emailAddress,
              icon: Icons.attach_email,
              obscureText: false,
              onChanged: (data) {
                email = data;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '1.10'.tr;
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return '1.11'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomBottom(
              text: '2.3'.tr,
              onPressed: () {
                Get.toNamed(HomeScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
