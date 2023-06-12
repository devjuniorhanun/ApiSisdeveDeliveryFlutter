import 'storage.dart';
import 'dart:html';

/// Classe SessionStorage
/// Respnavel por implementar os métodos abstratos
class SessionStorage extends Storage {
  /// Seta os dados a serem salvos
  @override
  String getData(String key) => window.sessionStorage[key] ?? '';

  /// Retorna os dados salvos
  @override
  void setData(String key, String value) => window.sessionStorage[key] = value;

  /// Limpa os dados
  @override
  void clean() => window.sessionStorage.clear();
}
