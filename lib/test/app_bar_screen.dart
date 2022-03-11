import 'package:flutter/material.dart';

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({Key? key}) : super(key: key);

  @override
  _AppBarScreenState createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('appbar'),
          actions: <Widget>[
            IconButton(
                tooltip: 'comment',
                onPressed: () {},
                icon: const Icon(Icons.restore)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.accessibility_new)),
            TextButton(
                style: buttonStyle,
                onPressed: () {},
                child: const Text('profile')),
          ],
        ),
        body: const Center(child: Text('content')),
      ),
    );
  }
}
