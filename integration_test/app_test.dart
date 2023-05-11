import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;

void main() {
  // Garante que o App ira rodar no emulador antes do teste
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (widgetTester) async {
    // Roda o projeto todo
    app.main();

    await widgetTester.pumpAndSettle(); // Aguarda o microprocessos
    expect(find.text('Menu'), findsNothing); // Não encontra o Menu
    // await Future.delayed(const Duration(seconds: 3));
    await widgetTester.tap(find.byIcon(Icons.menu)); // Clica no ícone de Menu
    // await Future.delayed(const Duration(seconds: 3));
    await widgetTester.pumpAndSettle(); // Aguarda o microprocessos
    expect(find.text('Menu'), findsOneWidget);
    // await Future.delayed(const Duration(seconds: 3));
  });

  testWidgets('Integration Test Clientes', (widgetTester) async {
    app.main();
    await widgetTester.pumpAndSettle();

    // Testando tela inicial
    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Testando o Drawer
    await widgetTester.tap(find.byIcon(Icons.menu));
    await widgetTester.pumpAndSettle();
    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Gerenciar clientes'), findsOneWidget);
    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);

    // Testar a navegação e a tela de tipos
    await widgetTester.tap(find.text('Tipos de clientes'));
    await widgetTester.pumpAndSettle();
    expect(find.text('Tipos de cliente'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.text('Platinum'), findsOneWidget);
    expect(find.text('Golden'), findsOneWidget);
    expect(find.text('Titanium'), findsOneWidget);
    expect(find.text('Diamond'), findsOneWidget);

    // Testar a criação de um Tipo de Cliente
    await widgetTester.tap(find.byType(FloatingActionButton));
    await widgetTester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await widgetTester.enterText(find.byType(TextFormField), 'Ferro');
    await widgetTester.tap(find.text('Selecionar icone'));
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.byIcon(Icons.card_giftcard));
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.text('Salvar'));
    await widgetTester.pumpAndSettle();
    expect(find.text('Ferro'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);
  });
}
