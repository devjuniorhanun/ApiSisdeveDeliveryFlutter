import 'package:flutter/material.dart';

import 'colors_app.dart';
import 'text_styles.dart';

/// Classe AppStyles()
/// Reponsavel por instancia os estilos do aplicativos
class AppStyles {
  /// Cria uma unica Instancia Singleton
  static AppStyles? _instance;

  AppStyles._();

  static AppStyles get instance {
    _instance ??= AppStyles._();
    return _instance!;
  }

  /// Estiliza o Botoões
  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: ColorsApp.instance.primary,
        textStyle: TextStyles.instance.textButtonLabel,
      );
}

/// Extende a AppStylesExtension. Podera ser usada de qual quer lugar
extension AppStylesExtension on BuildContext {
  AppStyles get appStyles => AppStyles.instance;
}
