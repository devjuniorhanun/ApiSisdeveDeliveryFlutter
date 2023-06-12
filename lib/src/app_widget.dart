import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/global/global_context.dart';
import 'core/ui/theme/theme_config.dart';

/// Arquivo de configuração inicial do MobX
class AppWidget extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  AppWidget({super.key}) {
    GlobalContext.instance.navigatorKey = _navigatorKey;
  }

  @override
  Widget build(BuildContext context) {
    /// Rota de Inicialização
    Modular.setInitialRoute('/login');
    Modular.setNavigatorKey(_navigatorKey);
    return MaterialApp.router(
      title: 'App Sisdeve Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}