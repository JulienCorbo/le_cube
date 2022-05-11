// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:le_cube/screens/login.dart';

void main() {
  testWidgets('Connexion utilisateur', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home:Login()));
    await tester.enterText(find.byTooltip("MAIL"), "augustin@gmail.com");
    await tester.enterText(find.byTooltip("MOT DE PASSE"), "test");
    await tester.tap(find.byWidget(const Text("CONNEXION")));
  });
}
