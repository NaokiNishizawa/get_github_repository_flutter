// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:src/main.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();

    const TEST_MOCK_STORAGE = './test/fixtures/core';
    const channel = MethodChannel(
      'plugins.flutter.io/path_provider',
    );
    channel.setMockMethodCallHandler((MethodCall MethodCall) async {
      return TEST_MOCK_STORAGE;
    });

    await initHiveForFlutter();
    await dotenv.load(fileName: 'assets/.env');
  });

  testWidgets('get github repository test', (WidgetTester tester) async {
    const widget = ProviderScope(child: MyApp());

    await tester.runAsync(() async {
      await tester.pumpWidget(widget);

      // 検索窓に"aaa"という文字列を入力する
      await tester.enterText(find.byType(TextField), 'aaa');
      expect(find.text('aaa'), findsOneWidget);

      // キーボードの完了を押下し検索を開始する
      await tester.testTextInput.receiveAction(TextInputAction.done);

      // 結果を確認する
      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(Scrollable), findsOneWidget);
    });
  });
}
