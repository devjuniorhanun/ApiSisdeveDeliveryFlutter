/// Classe SessionStorageKeys
/// Responsavel por guardar as constantes
enum SessionStorageKeys {
  /// Cria uma constante com o token
  accessToken('/ACCESS_TOKEN');

  final String key;

  /// Método Construtor
  const SessionStorageKeys(this.key);
}
