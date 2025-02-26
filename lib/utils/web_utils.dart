import 'dart:ui_web' as ui_web;

void registerViewFactory(String viewTypeId, dynamic factory) {
  ui_web.platformViewRegistry.registerViewFactory(viewTypeId, factory);
}
