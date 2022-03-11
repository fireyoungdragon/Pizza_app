import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefScreen extends StatelessWidget {
  const SharedPrefScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared preferences',
      home: MyHomePage(title: 'Shared preferences'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  dynamic _cnt = 'Перезагружено';
  Color _color = Colors.green;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
      _color = _convertColor(prefs.getString('color') ?? 'green');
    });
  }

  Color _convertColor(color) {
    Color _returned = Colors.green;
    switch (color) {
      case "green":
        _returned = Colors.green;
        break;
      case "purple":
        _returned = Colors.purple;
        break;
      case "red":
        _returned = Colors.red;
        break;
      case "deepPurple":
        _returned = Colors.deepPurple;
        break;
    }
    return _returned;
  }

  void _changeColor() async {
    final prefs = await SharedPreferences.getInstance();
    String _colorForSave = 'green';
    setState(() {
      if (_color == Colors.green) {
        _color = Colors.purple;
        _colorForSave = 'purple';
      } else if (_color == Colors.purple) {
        _color = Colors.red;
        _colorForSave = 'red';
      } else if (_color == Colors.red) {
        _color = Colors.deepPurple;
        _colorForSave = 'deepPurple';
      } else {
        _color = Colors.green;
        _colorForSave = 'green';
      }
      prefs.setString('color', _colorForSave);
    });
  }

  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);

      if (_cnt is String) _cnt = 0;
      _cnt++;
    });
  }

  void _decrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) - 1;
      prefs.setInt('counter', _counter);

      if (_cnt is String) _cnt = 0;
      _cnt++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _decrementCounter,
            icon: const Icon(Icons.remove_circle),
          )
        ],
        backgroundColor: _color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('sum counter'),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Text('num of clicks for current session'),
            Text(
              '$_cnt',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: TextButton(
                  child: Text(
                    'Смена цвета',
                    style: TextStyle(color: _color),
                  ),
                  onPressed: _changeColor),
            ),
            const Text(
              '(color saved)',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _color,
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
