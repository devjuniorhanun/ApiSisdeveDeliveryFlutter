import 'package:flutter/material.dart';

/// Classe ColorsApp()
/// Responsavel com estilizar as cores do aplicativos
class ColorsApp {
  /// Cria uma unica Instancia Singleton
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  /// Cor Primaria
  Color get primary => const Color(0XFF007D21);

  /// Cor Segundaria
  Color get secondary => const Color(0XFFFFAB18);

  /// Cor Preta
  Color get black => const Color(0XFF140E0E);
}
/// Extende a ColorsAppExtension. Podera ser usada de qual quer lugar
extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
