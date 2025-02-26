import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:rafaelgaedke/utils/platform_view_registry_fix.dart';

// Esta função será chamada antes da inicialização do aplicativo
Future<void> initializeWeb() async {
  if (kIsWeb) {
    // Use setUrlStrategy para remover o # da URL
    setUrlStrategy(PathUrlStrategy());

    // Aplica o fix para o aviso de platformViewRegistry
    applyPlatformViewRegistryFix();

    // Aqui você pode adicionar outras inicializações específicas para web
  }
}
