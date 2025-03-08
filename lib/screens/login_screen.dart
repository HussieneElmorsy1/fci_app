import 'dart:developer';
import 'package:fci_app/helper/show_snack_bar.dart';
import 'package:fci_app/screens/home_screen.dart';
import 'package:fci_app/widgets/custom_bottom.dart';
import 'package:fci_app/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:fci_app/styles/styles.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final ValueNotifier<Color> textColor = ValueNotifier<Color>(Colors.white);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  static const String id = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading.value,
      opacity: 5,
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    AppGaping.kGap100,
                    _buildLogo(),
                    AppGaping.kGap20,
                    _buildTitle(),
                    AppGaping.kGap20,
                    _buildSubTitle(),
                    AppGaping.kGap5,
                    _buildSubTitle2(),
                    AppGaping.kGap100,
                    _buildLoginText(),
                    AppGaping.kGap20,
                    _buildEmailField(),
                    AppGaping.kGap10,
                    _buildPasswordField(),
                    AppGaping.kGap10,
                    _buildLoginButton(context),
                    AppGaping.kGap10,
                    _buildSignUpSection(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return SvgPicture.asset(
      "assets/images/Vector.svg",
      height: 150,
      width: 150,
    );
  }

  Widget _buildTitle() {
    return Text(
      'التعليم العالي في مصر',
      style: AppTextStyles.headline1,
    );
  }

  Widget _buildSubTitle() {
    return Text(
      'جامعة قناة السويس',
      style: AppTextStyles.headline1,
    );
  }

  Widget _buildSubTitle2() {
    return Text(
      'جامعة حكومية مصرية',
      style: AppTextStyles.headline1,
    );
  }

  Widget _buildLoginText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Log in',
        style: AppTextStyles.bodyText,
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomFormTextField.customFormTextField(
      labelText: 'Email',
      helperText: 'Hi, please enter your email',
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      obscureText: false,
      onChanged: (data) {
        email = data;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Enter a valid email address';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return CustomFormTextField.customFormTextField(
      labelText: 'Password',
      helperText: 'Hi, please enter your password',
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.password,
      obscureText: true,
      onChanged: (data) {
        password = data;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomBottom(
      text: 'Log in',
      onPressed: () {
        if (formKey.currentState!.validate()) {
          isLoading.value = true;
          showSnackBar(context, 'Login button pressed.'); // Placeholder action
          isLoading.value = false;
        }
      },
    );
  }

  Widget _buildSignUpSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'don\'t have an account? ',
          style: AppTextStyles.caption,
        ),
        GestureDetector(
          onTap: () {
            textColor.value = Colors.blue; // Change color on tap
            Navigator.pushNamed(context, HomeScreen.id);
          },
          child: ValueListenableBuilder(
            valueListenable: textColor,
            builder: (context, color, child) {
              return Text(
                'Sign Up',
                style: AppTextStyles.caption.copyWith(color: color),
              );
            },
          ),
        ),
      ],
    );
  }
}
