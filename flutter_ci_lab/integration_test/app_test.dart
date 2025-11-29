import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_ci_lab/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('flujo completo: verificar inicio e incremento', (tester) async {
    // Iniciar la aplicación
    app.main();
    await tester.pumpAndSettle();

    // Verificar que el contador inicia en 0
    expect(find.text('0'), findsOneWidget);

    // Buscar botón por clave
    final Finder incrementButton = find.byKey(const Key('increment_button'));

    // Tap correcta (antes usabas fab, que no existe)
    await tester.tap(incrementButton);
    await tester.pumpAndSettle();

    // Verificar incremento
    expect(find.text('1'), findsOneWidget);
  });
}
