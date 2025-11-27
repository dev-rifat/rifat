
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(3),
          // border: Border.all(color: Colors.blueAccent, width: 1),
          // boxShadow: [
          //   BoxShadow(
          //     color: const Color(0xFF3B82F6).withValues(alpha: 0.4),
          //     blurRadius: 20,
          //     offset: const Offset(0, 8),
          //   ),
          // ],
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: Color(0xFF020227),
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
