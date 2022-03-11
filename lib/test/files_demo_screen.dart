import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FilesDemoScreen extends StatelessWidget {
  const FilesDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Чтение и Запись файлов',
      home: FlutterDemo(storage: CounterStorage()),
    );
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    return file.writeAsString('$counter');
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  State<FlutterDemo> createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    return widget.storage.writeCounter(_counter);
  }

  Future<File> _decrementCounter() {
    setState(() {
      _counter--;
    });

    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чтение и Запись файлов'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Text(
                'Счетчик кликов: $_counter',
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: _decrementCounter,
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.blue,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: IconButton(
                          onPressed: _incrementCounter,
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
