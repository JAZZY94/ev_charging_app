import 'package:ev_charging_app/screens/account_settings.dart';
import 'package:ev_charging_app/screens/charging_station_screen.dart';
import 'package:ev_charging_app/screens/home_screen.dart';
import 'package:ev_charging_app/screens/host_menu_screen.dart';
import 'package:ev_charging_app/screens/host_screen.dart';
import 'package:ev_charging_app/screens/sessions_screen.dart';
import 'package:ev_charging_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    const HomeScreen(),
    SessionsScreen(),
    const ChargersScreen(),
    const HostScreen(),
    const HostMenuScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color(0xfff020819),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xfff020819),
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bolt_rounded),
                label: 'Sessions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_gas_station),
                label: 'Chargers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.directions_car),
                label: 'C. Miles',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
