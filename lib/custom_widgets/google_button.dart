import 'package:flutter/material.dart';

class ContinueWithGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ContinueWithGoogleButton({required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 357,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(
          'assets/google.png',
          width: 24,
          height: 24,
        ),
        label: const Text('Continue with Google'),
        style: ElevatedButton.styleFrom(
          // foregroundColor: Colors.black,
          backgroundColor: const Color(0xff171A20), // Background color
          textStyle: const TextStyle(fontSize: 16, color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(
              color: Color(0xFF344054), // Border color
            ),
          ),
        ),
      ),
    );
  }
}
