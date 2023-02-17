import 'package:cs311hw08/character_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'genshin_characters_test.mocks.dart';

void main() {
  testWidgets('CharacterList should display details of the character',
      (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters/zhongli')))
        .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1),
            () => http.Response(
                '{"name":"Zhongli","vision":"Geo","weapon":"Polearm","nation":"Liyue","description":"A mysterious expert contracted by the Wangsheng Funeral Parlor. Extremely knowledgeable in all things."}',
                200)));
    await tester.pumpWidget(MaterialApp(
        home: CharacterDetail(
      client: client,
      name: 'zhongli',
    )));
    await tester.pumpAndSettle();
    final findColumn = find.byType(Column);
    expect(findColumn, findsOneWidget);
  });

  testWidgets('CharacterList should display details of the character',
      (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters/zhongli')))
        .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1), () => http.Response('Not Found', 404)));
    await tester.pumpWidget(MaterialApp(
        home: CharacterDetail(
      client: client,
      name: 'zhongli',
    )));
    await tester.pumpAndSettle();
    final findText = find.text("Exception: Failed to load characters");
    expect(findText, findsOneWidget);
  });
}
