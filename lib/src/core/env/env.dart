import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Classe de configurações das Variáveis de Ambientes
class Env {
  /// Cria uma unica Instancia Singleton
  static Env? _instance;

  Env._();

  /// Flutter Singleton pattern
  static Env get instance {
    _instance ??= Env._();
    return _instance!;
  }

  /// Método de carregamentos das variávies de ambientes no arquivo .env
  Future<void> load() => dotenv.load();

  /// Método que carrega o arquivo .env
  String? maybeGet(String key) => dotenv.maybeGet(key);

  /// Método de leitura das variáveis de ambientes no .env
  String get(String key) => dotenv.get(key);
}
