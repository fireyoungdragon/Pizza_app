import 'package:auth_page/screens/pizza_calc.dart';
import 'package:auth_page/screens/profile_page.dart';
import 'package:auth_page/screens/registration_page.dart';
import 'package:auth_page/screens/settings_screen.dart';
import 'package:auth_page/utils/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_page.dart';
import 'main_page.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

String chooseScreen = '/authregscreen';

class WelcomePageScreen extends StatefulWidget {
  const WelcomePageScreen({Key? key}) : super(key: key);

  @override
  State<WelcomePageScreen> createState() => _WelcomePageScreenState();
}

class _WelcomePageScreenState extends State<WelcomePageScreen> {
  @override
  void initState() {
    super.initState();
    choiceStartScreen();
  }

  void choiceStartScreen() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getInt('registered') == 1) {
        chooseScreen = '/mainScreen';
      }
      chooseScreen = '/authregscreen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalOrangeTheme(),
      scaffoldMessengerKey: messengerKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeWidget(),
        '/authregscreen': (context) =>
            const AuthRegScreen(), //привязваем AuthRegScreen к '/'
        '/pizzaCalc': (context) => const PizzaCalc(),
        '/mainScreen': (context) => const MainPageScreen(),
        '/regScreen': (context) => const RegistrationPage(),
        '/settingsScreen': (context) => const SettingsScreen(),
        '/profileScreen': (context) => const ProfileScreen(),
      },
    );
  }
}

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Click to Start'),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, chooseScreen);
                  },
                  icon: const Icon(Icons.local_pizza)),
            )
          ],
        ),
      ),
    );
  }
}
