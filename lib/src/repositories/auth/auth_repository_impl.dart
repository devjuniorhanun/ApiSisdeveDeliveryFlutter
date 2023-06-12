import 'dart:developer';

import 'package:dio/dio.dart';

import '../../auth/auth_repository.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/auth_model.dart';

/// Classe de implmentação de autenticação
class AuthRepositoryImpl implements AuthRepository {
  /// Inicia uma instancia com o servidor
  final CustomDio _dio;

  /// Método construtor
  /// Recebe a instancia do dio
  AuthRepositoryImpl(this._dio);

  /// Método de Login
  /// Reponsavel por efetuar o login com o servidor
  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      /// Cria um requisição com o servidor
      final result = await _dio.auth().post(
        '/auth',

        /// Passa os dados para o servidor
        data: {'email': email, 'password': password, 'admin': true},
      );

      /// Retorno os dados vindo do servidor em map
      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
      /// Verifica se exite o erro de login e senha invaldos
      if (e.response?.statusCode == 403) {
        log('Login ou senha inválidos!', error: e, stackTrace: s);
        throw UnauthorizedException();
      }

      /// Verifica se exite algum erro vindo do servidor
      log('Erro ao realizar login!', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar login!');
    }
  }
}
