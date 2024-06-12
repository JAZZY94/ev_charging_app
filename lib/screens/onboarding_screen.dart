import 'package:ev_charging_app/screens/onboarding_custom_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: const [
              OnboardingCustomWidget(
                image: 'assets/image 10.png',
                title: 'Share, Care, Earn with EV Chargers!',
                subTitle:
                    'El-Monde enables Vacation Hosts to easily share their EV Chargers with Guests to conveniently charge during holidays.',
              ),
              OnboardingCustomWidget(
                image: 'assets/image 10 (1).png',
                title: 'Charge anytime & Pay without stress!',
                subTitle:
                    'Guests can charge whenever they want during their stay and pay via many ways to  enjoy stress free holidays.',
              ),
              OnboardingCustomWidget(
                image: 'assets/image 10 (2).png',
                title: 'Setup once & Earn regularly',
                subTitle:
                    'Hosts can easily setup and sync booking schedules to the El-Monde app for regular earning on their Chargers.',
              ),
            ],
          ),
          Positioned(
            top: 461.0,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
