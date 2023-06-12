/// Classe Abstrata LoginService
/// Responsavel pelo serviço de Login
abstract class LoginService {
  /// Método que executa o login
  Future<void> execute(String email, String password);
}
