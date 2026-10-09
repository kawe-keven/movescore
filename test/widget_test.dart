import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movescore/main.dart';

void main() {
  testWidgets('Login screen loads with Google and Password options', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MoveScoreApp());

    // Verify that the title, Google login and Entrar buttons are present.
    expect(find.text('MoveScore'), findsOneWidget);
    expect(find.text('Entrar com o Google'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
  });

  testWidgets('Navigate to Register screen from Login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MoveScoreApp());

    // Scroll until Cadastre-se is visible
    await tester.scrollUntilVisible(
      find.text('Cadastre-se'),
      200.0,
      scrollable: find.byType(Scrollable).first,
    );

    // Tap on Cadastre-se link
    await tester.tap(find.text('Cadastre-se'));
    await tester.pumpAndSettle();

    // Verify Register screen elements are present
    expect(find.text('Criar Conta'), findsOneWidget);
    expect(find.text('Finalizar Cadastro'), findsOneWidget);
  });
}
