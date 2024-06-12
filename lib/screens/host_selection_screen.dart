import 'package:ev_charging_app/custom_widgets/button.dart';
import 'package:ev_charging_app/screens/account_settings.dart';
import 'package:ev_charging_app/screens/home_screen.dart';
import 'package:ev_charging_app/screens/my_home_page.dart';
import 'package:ev_charging_app/utils/constants.dart';
import 'package:flutter/material.dart';

class HostSelectionScreen extends StatefulWidget {
  const HostSelectionScreen({super.key});

  @override
  _HostSelectionScreenState createState() => _HostSelectionScreenState();
}

class _HostSelectionScreenState extends State<HostSelectionScreen> {
  bool isHost = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff020819),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Are you a host',
              style: AppTextStyles.titleTextStyle,
            ),
            const SizedBox(height: 8),
            const Text(
              'Please select the option that best describes you',
              style: AppTextStyles.subtitleTextStyle,
            ),
            const SizedBox(height: 24),
            CustomSelectionTile(
              text: 'Yes',
              selected: isHost,
              onTap: () {
                setState(() {
                  isHost = true;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomSelectionTile(
              text: 'No',
              selected: !isHost,
              onTap: () {
                setState(() {
                  isHost = false;
                });
              },
            ),
            const Spacer(),
            const Center(
              child: Text(
                'By starting my Host application, I agree to El-Monde\'s\nService Facilitation Terms to access the sale of\nCharging Services',
                style: AppTextStyles.smallTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 26),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
              backgroundColor: Colors.white,
              buttonTextColor: Colors.black,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class CustomSelectionTile extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const CustomSelectionTile({
    Key? key,
    required this.text,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? Colors.blue : Colors.grey,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                text,
                style: TextStyle(
                  color: selected ? Colors.blue : Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
            Radio<bool>(
              value: true,
              groupValue: selected,
              onChanged: (bool? value) {
                if (value != null && value) {
                  onTap();
                }
              },
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
