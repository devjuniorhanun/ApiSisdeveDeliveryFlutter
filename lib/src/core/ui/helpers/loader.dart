import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// Classe Loader()
/// Reponsavel por gerar os Loader do aplicativos
mixin Loader<T extends StatefulWidget> on State<T> {
  /// Desabilita o Loader
  var isOpen = false;

/// Método que carrega o Loader
  void showLoader() {
    /// Verifica se o Loader esta ativo
    if (!isOpen) {
      isOpen = true;
      /// Cria um Dialog de animação
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return LoadingAnimationWidget.threeArchedCircle(
            color: Colors.white, /// Cor
            size: 60, /// Tamanho
          );
        },
      );
    }
  }

/// Método de fecha o Loader
  void hideLoader() {
    /// Verifica se o Loader esta fechado
    if (isOpen) {
      isOpen = false;
      /// Fecha o Loader
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
/// Método que fecha os Loader, quando sai da tela
  @override
  dispose() {
    hideLoader();
    super.dispose();
  }
}
