import 'package:flutter/material.dart';
import 'global_theme.dart';

String currentScreen = 'AuthRegScreen';

Widget navDrawer(context) => Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/profileScreen');
                              },
                              icon: const Icon(
                                Icons.portrait_rounded,
                                size: 30,
                              ),
                              tooltip: 'Profile',
                            ),
                            Text(
                              'Profile',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.app_registration_outlined,
              color: iconColor,
            ),
            title: Text(
              'Autorization / Registration',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {
              Navigator.pop(context);
              if (currentScreen == 'MainScreen') {
                currentScreen = 'AuthRegScreen';
                Navigator.pushNamed(context, '/');
              }
            },
          ),
          const Divider(
            color: iconColor,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            title: Text(
              'Main page',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {
              Navigator.pop(context);
              if (currentScreen == 'AuthRegScreen') {
                currentScreen = 'MainScreen';
                Navigator.pushNamed(context, '/mainScreen');
              }
            },
            leading: const Icon(
              Icons.local_pizza_outlined,
              color: iconColor,
            ),
          ),
          ListTile(
            title: Text(
              'Pizza calc',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/pizzaCalc');
            },
            leading: const Icon(
              Icons.calculate_outlined,
              color: iconColor,
            ),
          ),
          const Divider(
            color: iconColor,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.settings_outlined,
              color: iconColor,
            ),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settingsScreen');
            },
          )
        ],
      ),
    );
