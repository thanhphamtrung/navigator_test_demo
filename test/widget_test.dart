// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_test_navigator/main.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MyTypeFake extends Fake implements Route {}

void main() {
  NavigatorObserver mockObserver;
  mockObserver = MockNavigatorObserver();
  setUpAll(() {
    registerFallbackValue(MyTypeFake());
  });
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MyApp(),
      navigatorObservers: [mockObserver],
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    verify(() => mockObserver.didPush(any(), any())).called(1);
  });
}
