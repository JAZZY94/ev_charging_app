import 'package:ev_charging_app/custom_widgets/button.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff020819),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Account settings'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SettingsSection(
            title: 'General',
            tiles: [
              SettingsTile(
                icon: Icons.notifications_outlined,
                text: 'Notifications',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.language,
                text: 'Language',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SettingsSection(
            title: 'About Us',
            tiles: [
              SettingsTile(
                icon: Icons.info_outline,
                text: 'About us',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.help_outline,
                text: 'Help',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SettingsSection(
            title: 'Legal',
            tiles: [
              SettingsTile(
                icon: Icons.policy_outlined,
                text: 'Privacy Policy',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.description_outlined,
                text: 'Terms & Conditions',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.assignment_outlined,
                text: 'Service Facilitation Terms',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(
                icon: Icons.close,
                text: 'Close Account',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CloseAccountBottomSheet();
                    },
                    isScrollControlled: true,
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                  );
                },
                textColor: Colors.red,
                trailingIconColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsTile> tiles;

  const SettingsSection({
    Key? key,
    required this.title,
    required this.tiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xfff98A2B3),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1D2939),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: tiles,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? trailingIconColor;

  const SettingsTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.textColor,
    this.trailingIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xfffEAECF0)),
      title: Text(
        text,
        style: TextStyle(
          color: textColor ?? const Color(0xfffEAECF0),
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios,
          color: trailingIconColor ?? const Color(0xfffEAECF0)),
      onTap: onTap,
    );
  }
}

class CloseAccountBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 457,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Color(0xFF1D2939),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Close Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              height: 1,
              color: Color(0xfff344054),
            ),
            const SizedBox(
              height: 48,
            ),
            const Text(
              'Are you sure?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 39.0),
              child: Text(
                'Deleting your account will result in the permanent loss of all your data, settings, and associated information',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 2,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Close Accont',
              onPressed: () {},
              backgroundColor: const Color(0xfffF6285F),
            ),
            const SizedBox(height: 16),
            CustomButton(text: 'Cancel', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
