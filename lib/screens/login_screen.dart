import 'dart:developer';
import 'package:fci_app/helper/show_snack_bar.dart';
import 'package:fci_app/screens/forgot_password_screen.dart';
import 'package:fci_app/screens/home_screen.dart';
import 'package:fci_app/widgets/custom_bottom.dart';
import 'package:fci_app/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:fci_app/styles/styles.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final ValueNotifier<Color> textColor = ValueNotifier<Color>(Colors.white);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  String? email = '', password = '';
  final GlobalKey<FormState> formKey = GlobalKey();
  static const String id = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading.value,
      opacity: 5,
      child: Scaffold(
        backgroundColor: AppColors.white,
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
                    AppGaping.kGap125,
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
    return Stack(
      children: [
        Text("1.7".tr, style: AppTextStyles.headline1),
        Text("1.7".tr, style: AppTextStyles.headline1Fill),
      ],
    );
  }

  Widget _buildSubTitle() {
    return Text(
      '1.8'.tr,
      style: AppTextStyles.bodyText,
    );
  }

  Widget _buildSubTitle2() {
    return Text(
      '1.9'.tr,
      style: AppTextStyles.bodyText,
    );
  }

  Widget _buildEmailField() {
    return CustomFormTextField(
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
    );
  }

  Widget _buildPasswordField() {
    return CustomFormTextField(
      labelText: '1.3'.tr,
      helperText: '1.5'.tr,
      keyboardType: TextInputType.visiblePassword,
      icon: Icons.password,
      obscureText: true,
      onChanged: (data) {
        password = data;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '1.12'.tr;
        }
        if (value.length < 6) {
          return '1.13'.tr;
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomBottom(
      text: '1.1'.tr,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          isLoading.value = true;
          showSnackBar(context, '1.14'.tr); // Placeholder action
          isLoading.value = false;
        }
      },
    );
  }

  Widget _buildSignUpSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            textColor.value = Colors.blue; // Change color on tap
            // Navigator.pushNamed(context, HomeScreen.id);
            Get.toNamed(ForgotPasswordScreen.id);
          },
          child: ValueListenableBuilder(
            valueListenable: textColor,
            builder: (context, color, child) {
              return Text(
                '1.6'.tr,
                style: AppTextStyles.caption,
              );
            },
          ),
        ),
      ],
    );
  }
}
