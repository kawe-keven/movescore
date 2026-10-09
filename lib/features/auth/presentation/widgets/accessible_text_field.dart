import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccessibleTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData prefixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool obscureText;

  const AccessibleTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF222222),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          obscureText: obscureText,
          style: const TextStyle(fontSize: 18, color: Colors.black87),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(prefixIcon, size: 28, color: secondaryColor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: secondaryColor, width: 2.5),
            ),
          ),
        ),
      ],
    );
  }
}
