/// Classe Abstrata Storage
/// Reponsavel por gravar e apagar as credenciais, na sessão do browser
abstract class Storage {
  /// Seta os dados a serem salvos
  void setData(String key, String value);

  /// Retorna os dados salvos
  String getData(String key);

  /// Limpa os dados
  void clean();
}
