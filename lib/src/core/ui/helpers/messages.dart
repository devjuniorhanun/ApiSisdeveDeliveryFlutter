import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

/// Classe Messages()
/// Responsavel por gerenciar as Mensagens do aplicativo
mixin Messages<T extends StatefulWidget> on State<T> {
  /// Mensagens de Errors
  void showError(String message) {
    _showSnackBar(
      AwesomeSnackbarContent(
        title: 'Erro',
        message: message,
        contentType: ContentType.failure,
      ),
    );
  }

  /// Mensagens de Adivertencias
  void showWarning(String message) {
    _showSnackBar(
      AwesomeSnackbarContent(
        title: 'Atenção',
        message: message,
        contentType: ContentType.warning,
      ),
    );
  }

  /// Mensagens de Informações
  void showInfo(String message) {
    _showSnackBar(
      AwesomeSnackbarContent(
        title: 'Atenção',
        message: message,
        contentType: ContentType.help,
      ),
    );
  }

  /// Mensagens de Sucessos
  void showSuccess(String message) {
    _showSnackBar(
      AwesomeSnackbarContent(
        title: 'Sucesso',
        message: message,
        contentType: ContentType.success,
      ),
    );
  }

  ///Método de instanciação das Mensagens
  void _showSnackBar(AwesomeSnackbarContent content) {
    /// Abre showSnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.only(top: 72),
        backgroundColor: Colors.transparent,
        content: content,
      ),
    );
  }
}
