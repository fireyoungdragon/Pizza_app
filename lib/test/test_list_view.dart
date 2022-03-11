import 'package:auth_page/utils/global_theme.dart';
import 'package:flutter/material.dart';

class MyListViewScreen extends StatelessWidget {
  const MyListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalOrangeTheme(),
      home: const Scaffold(
        body: MySimpleListClickable(),
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  const MyListItem({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(color: Colors.lightBlueAccent, border: Border.all()),
      child: Text(
        'Эелемент # $number',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}

class SimpleList extends StatelessWidget {
  const SimpleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.blue),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        height: 400,
        width: 200,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            MyListItem(
              number: 1,
            ),
            MyListItem(
              number: 2,
            ),
            MyListItem(
              number: 3,
            ),
            MyListItem(
              number: 4,
            ),
            MyListItem(
              number: 5,
            ),
            MyListItem(
              number: 6,
            ),
            MyListItem(
              number: 7,
            ),
            MyListItem(
              number: 8,
            ),
            MyListItem(
              number: 9,
            ),
            MyListItem(
              number: 10,
            ),
            MyListItem(
              number: 11,
            ),
            MyListItem(
              number: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class MySimpleListBuilder extends StatelessWidget {
  MySimpleListBuilder({Key? key}) : super(key: key);

  var list = List<int>.generate(50, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return MyListItem(number: index);
        });
  }
}

class MySimpleListSeparated extends StatelessWidget {
  MySimpleListSeparated({Key? key}) : super(key: key);

  var list = List<int>.generate(50, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return MyListItem(number: index);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 2,
        color: Colors.black,
        indent: 20,
        endIndent: 20,
      ),
    );
  }
}

class MySimpleListClickable extends StatefulWidget {
  const MySimpleListClickable({Key? key}) : super(key: key);

  @override
  _MySimpleListClickableState createState() => _MySimpleListClickableState();
}

class _MySimpleListClickableState extends State<MySimpleListClickable> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Text('Item $i'),
            selected: i == _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = i;
              });
            },
          );
        });
  }
}
