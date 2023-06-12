import 'dart:convert';

/// Classe de Modelo de Autentiação
class AuthModel {
  /// Variável de Token
  final String accessToken;
  AuthModel({
    required this.accessToken,
  });

  /// Método que recebe o token
  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
    };
  }

  /// Método que percorre o retorno do servidor
  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      accessToken: (map['access_token'] ?? '') as String,
    );
  }
/// Método que transforma o map que veio do servidor em json
  String toJson() => json.encode(toMap());

/// Método que transforma o json em map
  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
