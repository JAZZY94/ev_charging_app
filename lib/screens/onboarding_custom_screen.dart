import 'package:ev_charging_app/custom_widgets/button.dart';
import 'package:ev_charging_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class OnboardingCustomWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const OnboardingCustomWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$image'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 86.0,
          left: 24,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              'assets/Header.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          top: 86.0,
          right: 24,
          child: Container(
              width: 46,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: InkWell(
                child: const Center(
                    child: Text(
                  'Skip',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                  );
                },
              )),
        ),
        Positioned(
          top: 500.0,
          left: 24,
          right: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, height: 1.5),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 698.0,
          left: 0,
          right: 0,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                  backgroundColor: const Color(0xfffffffff),
                  buttonTextColor: Colors.black,
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                    );
                  })),
        ),
      ],
    );
  }
}
