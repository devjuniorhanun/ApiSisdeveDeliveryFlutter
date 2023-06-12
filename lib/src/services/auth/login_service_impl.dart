import '../../auth/auth_repository.dart';
import '../../core/global/constants.dart';
import '../../core/storage/storage.dart';
import 'login_service.dart';

/// Classe de implementação LoginServiceImpl
/// Responsavel por implementar o login
class LoginServiceImpl implements LoginService {
  /// Instanciando o Repositorio
  final AuthRepository _authRepository;

  /// Instanciado o Storage
  final Storage _storage;

  /// Método Construtor
  /// Recebe o Repositorio e o storage
  LoginServiceImpl(
    this._authRepository,
    this._storage,
  );

  /// Métoto que execulta o login
  @override
  Future<void> execute(String email, String password) async {
    /// Cria uma requesição ao servidor
    final authModel = await _authRepository.login(email, password);

    /// Grava a sessão
    _storage.setData(SessionStorageKeys.accessToken.key, authModel.accessToken);
  }
}
