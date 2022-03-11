import 'package:auth_page/utils/drawer_settings.dart';
import '../utils/global_theme.dart';
import 'main_page.dart';
import 'profile_page.dart';
import 'settings_screen.dart';
import 'package:flutter/material.dart';
import 'pizza_calc.dart';
import 'registration_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

final _messengerKey = GlobalKey<ScaffoldMessengerState>();

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalOrangeTheme(),
      scaffoldMessengerKey: _messengerKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthRegScreen(),
        '/pizzaCalc': (context) => const PizzaCalc(),
        '/mainScreen': (context) => const MainPageScreen(),
        '/regScreen': (context) => const RegistrationPage(),
        '/settingsScreen': (context) => const SettingsScreen(),
        '/profileScreen': (context) => const ProfileScreen(),
      },
    );
  }
}

class AuthRegScreen extends StatefulWidget {
  const AuthRegScreen({Key? key}) : super(key: key);

  @override
  _AuthRegScreenState createState() => _AuthRegScreenState();
}

class _AuthRegScreenState extends State<AuthRegScreen> {
  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder _borderStyle = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        borderSide:
            BorderSide(color: Theme.of(context).colorScheme.primary, width: 2));

    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: 'PIZZA CLUB',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
            ]),
          ),
          backgroundColor: Colors.deepPurple,
          toolbarHeight: 45,
        ),
        drawer: navDrawer(context),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    width: 110,
                    height: 83,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter login (10 numbers of your phone)',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.secondary,
                      enabledBorder: _borderStyle,
                      focusedBorder: _borderStyle,
                      hintText: 'Phone number',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.secondary,
                      enabledBorder: _borderStyle,
                      focusedBorder: _borderStyle,
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                      width: 154,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          _messengerKey.currentState!.showSnackBar(
                            const SnackBar(
                                duration: Duration(milliseconds: 500),
                                backgroundColor: snackBarColor,
                                content: Text('check data')),
                          );
                        },
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Don't have an account yet?",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Text(
                      "Let's register!",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/regScreen');
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Text(
                      'Forgot your password?',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    onTap: () {
                      _messengerKey.currentState!.showSnackBar(
                        const SnackBar(
                            duration: Duration(milliseconds: 500),
                            backgroundColor: Color(0xff4e342e),
                            content: Text('Процедура восстановления пароля')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
