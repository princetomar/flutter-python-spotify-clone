import 'package:flutter/material.dart';
import 'package:listener/src/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const AuthGradientButton(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Pallete.gradient1,
            Pallete.gradient2,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(295, 55),
            backgroundColor: Colors.transparent),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
