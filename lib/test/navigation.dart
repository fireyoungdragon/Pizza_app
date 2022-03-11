import 'package:flutter/material.dart';

class NavigationDemo extends StatefulWidget {
  const NavigationDemo({Key? key}) : super(key: key);

  @override
  _NavigationDemoState createState() => _NavigationDemoState();
}

class _NavigationDemoState extends State<NavigationDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/contacts': (context) => const SecondScreen(),
      },
    );
  }
}

Widget navDrawer(context) => Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Container(
              height: 200,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.ad_units),
            title: const Text('to main'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/',
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_box_sharp),
            title: const Text('to contacts'),
            onTap: () {
              Navigator.pushNamed(context, '/contacts');
            },
          )
        ],
      ),
    );

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
      drawer: navDrawer(context),
      body: const Center(
        child: Text('main'),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      drawer: navDrawer(context),
      body: const Center(
        child: Text('page with contacts'),
      ),
    );
  }
}
