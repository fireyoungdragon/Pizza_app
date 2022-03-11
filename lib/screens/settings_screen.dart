import 'package:auth_page/utils/global_theme.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _currentIndex = 0;
  void _onItemTapped(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  static final List<Widget> _listTexts = <Widget>[
    Column(
      children: [
        const Text(
          'Main app settings',
          style: TextStyle(color: blackColor),
        ),
        const Divider(
          color: Colors.black,
          height: 2,
        ),
      ],
    ),
    const Text(
      'Display settings',
      style: TextStyle(color: blackColor),
    ),
    const Text(
      'Version 1.0',
      style: TextStyle(color: blackColor),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.domain_verification),
              label: 'Main',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_display),
              label: 'Display',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.announcement),
              label: 'About',
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.primary,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromRGBO(0, 0, 0, 0.4),
          onTap: _onItemTapped),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 50,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Reset',
              style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
            ),
          )
        ],
      ),
      body: Center(child: _listTexts.elementAt(_currentIndex)),
    );
  }
}
