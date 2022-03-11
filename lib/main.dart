import 'package:auth_page/test/networking_screen.dart';
import 'package:flutter/material.dart';
import 'screens/auth_page.dart';

import 'package:auth_page/test/shared_preferences.dart';
import 'package:auth_page/test/files_demo_screen.dart';
import 'package:auth_page/test/test_authorization.dart';

import 'package:auth_page/test/network_post_keys_3.2.dart';

void main() {
  runApp(const SharedPrefScreen());

  runApp(const FilesDemoScreen());

  runApp(const AuthorizationTest());

  runApp(const NetworkPostForKeys32());

  runApp(const AuthPage());
}
