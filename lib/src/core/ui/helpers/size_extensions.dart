import 'package:flutter/material.dart';

/// Classe SizeExtensions
/// Responsavel por extender o BuildContext
/// Para pegar os tamanhos das telas do dispositivos e adaptar as telas do aplicativo
extension SizeExtensions on BuildContext {
  /// Pega a largura do dispositivo
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Pega a altura do dispositivo
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Retorna o meno tamanho entre largura e altura
  double get screenShortestSide => MediaQuery.of(this).size.shortestSide;

  /// Retorna o mairo tamanho entre largura e altura
  double get screenLongestSide => MediaQuery.of(this).size.longestSide;

  /// Retorna uma porcentagem da largura da tela
  double percentWidth(double percent) => screenWidth * percent;

  /// Retorna uma porcentagem da altura da tela
  double percentHeight(double percent) => screenHeight * percent;
}
