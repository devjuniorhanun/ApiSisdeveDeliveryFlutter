import '../../models/auth_model.dart';
 
/// Classe abastada AuthRepository
abstract class AuthRepository {
  /// Método abstrado de Login
  Future<AuthModel> login(String email, String password);
}
