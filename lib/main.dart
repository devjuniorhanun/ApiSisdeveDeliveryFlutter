import 'src/core/env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import './src/app_module.dart';
import './src/app_widget.dart';

Future<void> main() async {
  /// Inicialiazando as configurações do .env
  WidgetsFlutterBinding.ensureInitialized();

  /// Carrega as variáveis de ambientes
  await Env.instance.load();

  /// Execulta o aplicativo
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
