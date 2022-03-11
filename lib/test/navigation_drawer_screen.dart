import 'package:flutter/material.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  final keyMessenger = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: keyMessenger,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.deepPurple),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                      const Text(
                        'Catalog',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.call_to_action_rounded),
                title: const Text('Catalog'),
                onTap: () {
                  keyMessenger.currentState!.showSnackBar(const SnackBar(
                      backgroundColor: Color(0xff4e342e),
                      content: Text('Transfer to catalog')));
                },
              ),
              ListTile(
                leading: const Icon(Icons.restore_from_trash),
                title: const Text('Bin'),
                onTap: () {
                  keyMessenger.currentState!.showSnackBar(const SnackBar(
                      backgroundColor: Color(0xff4e342e),
                      content: Text('Transfer to catalog')));
                },
              ),
              const Divider(
                //разделитель
                color: Colors.deepPurple,
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 10), child: Text('Profile')),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  keyMessenger.currentState!.showSnackBar(const SnackBar(
                      backgroundColor: Color(0xff4e342e),
                      content: Text('Transfer to catalog')));
                },
              ),
            ],
          ),
        ),
        body: const Center(child: Text('some text')),
      ),
    );
  }
}
