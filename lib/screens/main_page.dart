import 'package:auth_page/utils/drawer_settings.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                  text: 'Pizza ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
        ),
        actions: [
          IconButton(
              tooltip: 'Notifications',
              onPressed: () {},
              icon: const Icon(Icons.notifications_active))
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 50,
      ),
      drawer: navDrawer(context),
      body: Center(
          child: Text(
        'Main page with news and promos',
        style: Theme.of(context).textTheme.bodyText1,
      )),
    );
  }
}
