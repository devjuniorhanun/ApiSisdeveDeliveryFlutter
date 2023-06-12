import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../core/exceptions/unauthorized_exception.dart';
import '../../services/auth/login_service.dart';
part 'login_controller.g.dart';

/// Status da tela de login
enum LoginStateStatus {
  /// Status inicial
  initial,

  /// Status loading
  loading,

  /// Status sucesso
  success,

  /// Status erro
  error;
}

/// Classe LoginController
/// Reponsavel por contralar o modulo de Login
class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  /// Instanciando o LoginService
  final LoginService _loginService;

  /// Status Inicial
  @readonly
  var _loginStatus = LoginStateStatus.initial;

  /// Gera mensagens de error
  @readonly
  String? _errorMessage;

  /// Método Construtor
  LoginControllerBase(this._loginService);

  /// Ação de Login
  @action
  Future<void> login(String email, String password) async {
    try {
      /// Status de Loading
      _loginStatus = LoginStateStatus.loading;

      /// Cria uma requisição com o servidor
      await _loginService.execute(email, password);

      /// Status de Sucesso
      _loginStatus = LoginStateStatus.success;
    }

    /// Verifica se ocorreu algum erro
    /// Login ou senha invalida
    on UnauthorizedException {
      _errorMessage = 'Login ou senha inváldos!';

      /// Status Error
      _loginStatus = LoginStateStatus.error;
    }

    /// Erros de comunicação com o Servidor
    catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      _errorMessage = 'Tente novamente mais tarde';
      _loginStatus = LoginStateStatus.error;
    }
  }
}
