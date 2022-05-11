// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import 'package:le_cube/main.dart';
import 'package:le_cube/models/user.dart';
import 'package:le_cube/screens/login.dart';
import 'package:le_cube/utils/userInfo.dart';

void main() {
  testWidgets('Connexion utilisateur', (WidgetTester tester) async {

    int build(BuildContext context) {
      logUser(context, "test", "augustin@gmail.com").then((result) async {
        print('La connexion est bonne man ;)');
      });
      return 1;
    }
  });
}
