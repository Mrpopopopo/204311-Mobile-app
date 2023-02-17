import 'package:cs311hw08/character_detail.dart';
import 'package:cs311hw08/character_list.dart';
import 'package:cs311hw08/genshin_characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'genshin_characters_test.mocks.dart';

void main() {
  testWidgets('CharacterList should display ListView', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1),
            () => http.Response(
                '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',
                200)));
    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CharacterList(client: client))));
    await tester.pumpAndSettle();
    final findListView = find.byType(ListView);
    expect(findListView, findsOneWidget);
  });

  testWidgets('CharacterList should display ListView', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1), () => http.Response('Not Found', 404)));
    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CharacterList(client: client))));
    await tester.pumpAndSettle();
    final findListView = find.byType(ListView);
    expect(findListView, findsNothing);
  });

  testWidgets('CharacterList should display ListTile', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1),
            () => http.Response(
                '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',
                200)));
    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CharacterList(client: client))));
    await tester.pumpAndSettle();
    final findListTile = find.byType(ListTile);
    expect(findListTile, findsWidgets);
  });

  testWidgets('CharacterList should display Text', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1),
            () => http.Response(
                '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',
                200)));
    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CharacterList(client: client))));
    await tester.pumpAndSettle();
    final findText = find.byType(Text);
    expect(findText, findsWidgets);
  });
  testWidgets('CharacterList should display Text', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => Future.delayed(
            const Duration(seconds: 1),
            () => http.Response(
                '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',
                200)));
    await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CharacterList(client: client))));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();
    final findTap = find.byType(CharacterDetail);
    expect(findTap, findsOneWidget);
  });
}
