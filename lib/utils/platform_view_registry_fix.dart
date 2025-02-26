// Este arquivo serve como um "monkey patch" para resolver o aviso de API obsoleta
// relacionado ao platformViewRegistry no Flutter Web

// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';

void applyPlatformViewRegistryFix() {
  try {
    // Verifica se estamos no ambiente web e se o objeto ui existe
    if (js.context.hasProperty('ui')) {
      // Obtém o objeto ui
      final ui = js.context['ui'];

      // Verifica se o objeto platformViewRegistry existe
      if (ui != null && ui.hasProperty('platformViewRegistry')) {
        // Cria uma referência ao objeto correto em dart:ui_web
        final correctRegistry = js.JsObject.fromBrowserObject(ui['platformViewRegistry']);

        // Substitui o objeto obsoleto pelo correto
        ui['_platformViewRegistry'] = correctRegistry;
      }
    }
  } catch (e) {
    debugPrint('Erro ao aplicar fix para platformViewRegistry: $e');
  }
}
