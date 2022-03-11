import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text(
                  'Case 2.5',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  '20 clickable elem',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Theme.of(context).colorScheme.primary,
                              blurRadius: 10)
                        ],
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 2)),
                    width: 300,
                    height: 300,
                    margin: const EdgeInsets.all(10),
                    child: const ClickableListOne()),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      'Clickable elems "users", from class, type "User"',
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    )),
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Theme.of(context).colorScheme.primary,
                              blurRadius: 10)
                        ],
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 2)),
                    width: 300,
                    height: 300,
                    margin: const EdgeInsets.all(10),
                    child: const ClickableUsersList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClickableListOne extends StatefulWidget {
  const ClickableListOne({Key? key}) : super(key: key);

  @override
  _ClickableListOneState createState() => _ClickableListOneState();
}

class _ClickableListOneState extends State<ClickableListOne> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            margin: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).colorScheme.secondary),
            child: ListTile(
              title: Text('Elem ${i + 1}'),
              selected: i == selectedIndex,
              selectedColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                setState(() {
                  selectedIndex = i;
                });
              },
            ),
          );
        });
  }
}

class User {
  String name = '';
  String phone = '';

  User(String n, String p) {
    name = n;
    phone = p;
  }
}

List users = <User>[
  User('Jerry', '80000000000'),
  User('Freddy', '81111111111'),
  User('Катя', '822222222222'),
  User('John', '833333333333'),
  User('Kate', '844444444444'),
  User('George', '855555555555'),
  User('Sarah', '866666666666'),
  User('Kyle', '877777777777'),
  User('Nika', '888888888888'),
];

class ClickableUsersList extends StatefulWidget {
  const ClickableUsersList({Key? key}) : super(key: key);

  @override
  State<ClickableUsersList> createState() => _ClickableUsersListState();
}

class _ClickableUsersListState extends State<ClickableUsersList> {
  int _select = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int i) {
        return Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Theme.of(context).colorScheme.secondary),
          child: ListTile(
              selectedColor: Theme.of(context).colorScheme.primary,
              selected: i == _select,
              title:
                  Text('Name: ${users[i].name}\nPhone num: ${users[i].phone}'),
              onTap: () {
                setState(() {
                  _select = i;
                });
              }),
        );
      },
    );
  }
}
