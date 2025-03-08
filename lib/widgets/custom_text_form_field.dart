import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField.customFormTextField({
    super.key,
    required this.labelText,
    required this.helperText,
    required this.keyboardType,
    required this.icon,
    required this.obscureText,
    this.onChanged,
    this.validator,
  });

  final String labelText;
  final String helperText;
  final TextInputType keyboardType;
  final IconData icon;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator, // Use the provided validator
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 3,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF123456), // Color matching your background
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF123456), // Color matching your background
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        filled: false,
        helperText: helperText,
        helperStyle: const TextStyle(
          color: Colors.white,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        suffixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        errorStyle: TextStyle(
          color: Colors.white.withOpacity(0.8), // Subtle error message color
          fontSize: 14, // Font size for error message
          fontWeight:
              FontWeight.w500, // Medium weight to slightly emphasize error
        ),
      ),
    );
  }
}
