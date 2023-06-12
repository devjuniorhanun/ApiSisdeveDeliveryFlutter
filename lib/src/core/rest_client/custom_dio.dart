import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import '../env/env.dart';
import '../storage/storage.dart';
import 'interceptors/auth_interceptor.dart';

/// Classe CustomDio
/// Responsavel por configurar o dio
class CustomDio extends DioForBrowser {
  late AuthInterceptor _authInterceptor;

  CustomDio(Storage storage)
      : super(
          BaseOptions(
            /// Endereçio do servidor
            baseUrl: Env.instance.get('backend_base_url'),

            /// Tempo que cada resposta
            connectTimeout: const Duration(seconds: 5),

            /// Tempo maximo que pode demorar cada requisição
            receiveTimeout: const Duration(seconds: 60),
            /* headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            }, */
          ),
        ) {
    // Performance bug fix:
    /* interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    ); */

    _authInterceptor = AuthInterceptor(storage);
  }

  /// Gera requisições autenticadas
  CustomDio auth() {
    // Performance bug fix:
    if (!interceptors.contains(_authInterceptor)) {
      interceptors.add(_authInterceptor);
    }
    return this;
  }

  /// Gera requisições sem autenticações
  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
