import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _choiceScreen = '/loginscreen';

OutlineInputBorder _textFieldBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: Color(0xff1b5e20), width: 2));

String user = '';

String _hint = 'Enter login. At least 4 characters';

class AuthorizationTest extends StatefulWidget {
  const AuthorizationTest({Key? key}) : super(key: key);

  @override
  State<AuthorizationTest> createState() => _AuthorizationTestState();
}

class _AuthorizationTestState extends State<AuthorizationTest> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    final pr = await SharedPreferences.getInstance();
    bool _registered = pr.getBool('registeredTest') ?? false;
    setState(() {
      if (_registered) {
        _choiceScreen = '/mainscreen';
        user = pr.getString('userTest') ?? 'noname';
      } else {
        _choiceScreen = '/loginscreen';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const WelcomePageTest(),
        '/loginscreen': (context) => const LoginScreenTest(),
        '/mainscreen': (context) => const MainScreenTest(),
      },
    );
  }
}

class WelcomePageTest extends StatefulWidget {
  const WelcomePageTest({Key? key}) : super(key: key);

  @override
  State<WelcomePageTest> createState() => _WelcomePageTestState();
}

class _WelcomePageTestState extends State<WelcomePageTest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Case 3.1',
                style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 110,
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Вход',
                          style: TextStyle(
                              color: Colors.green[900],
                              decoration: TextDecoration.underline,
                              fontSize: 16),
                        ),
                        Icon(Icons.adb, color: Colors.green[900])
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, _choiceScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreenTest extends StatefulWidget {
  const LoginScreenTest({Key? key}) : super(key: key);

  @override
  State<LoginScreenTest> createState() => _LoginScreenTest();
}

class _LoginScreenTest extends State<LoginScreenTest> {
  void saveLogin() async {
    final pr = await SharedPreferences.getInstance();
    pr.setBool('registeredTest', true);
    pr.setString('userTest', user);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Логин',
                style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 300,
                child: TextField(
                    onChanged: (val) {
                      user = val;
                    },
                    showCursor: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.green[100],
                      enabledBorder: _textFieldBorder,
                      focusedBorder: _textFieldBorder,
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 150,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      if (user == '') {
                        setState(() {
                          _hint =
                              "You didn't enter login. At least 4 characters";
                        });
                      } else {
                        if (user.length <= 3) {
                          setState(() {
                            _hint = 'Login mast be at least 4 characters';
                          });
                        } else {
                          saveLogin();
                          Navigator.pushNamed(context, '/mainscreen');
                        }
                      }
                    },
                    child: const Text(
                      'вход',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 5), child: Text(_hint))
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreenTest extends StatefulWidget {
  const MainScreenTest({Key? key}) : super(key: key);

  @override
  State<MainScreenTest> createState() => _MainScreenTest();
}

class _MainScreenTest extends State<MainScreenTest> {
  void clearUserData() async {
    final pr = await SharedPreferences.getInstance();
    pr.setBool('registeredTest', false);
    pr.setString('userTest', 'unregistered');
    user = '';
    _hint = 'Enter login. At least 4 characters';
    Navigator.pushNamed(context, '/loginscreen');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome $user',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: InkWell(
                  child: const Text(
                    'Unlog',
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    clearUserData();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
