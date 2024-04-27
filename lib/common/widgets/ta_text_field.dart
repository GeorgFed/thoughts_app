import 'package:flutter/material.dart';

enum TATextFieldSize {
  medium,
  large,
}

class TATextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final TATextFieldSize size;
  final void Function(String)? onChanged;

  const TATextField({
    required this.controller,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.size = TATextFieldSize.medium,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: size == TATextFieldSize.large ? 128 : 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: theme.cardColor,
      ),
      child: Column(
        mainAxisAlignment: size == TATextFieldSize.large
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          Flexible(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              maxLines: size == TATextFieldSize.large ? null : 1,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hint,
                hintMaxLines: size == TATextFieldSize.large ? 3 : 1,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16),
                hintStyle: TextStyle(
                  color: theme.inputDecorationTheme.fillColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
