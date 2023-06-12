import 'package:flutter_modular/flutter_modular.dart';

import '../../auth/auth_repository.dart';
import '../../repositories/auth/auth_repository_impl.dart';
import '../../services/auth/login_service.dart';
import '../../services/auth/login_service_impl.dart';
import 'login_controller.dart';
import 'login_page.dart';

/// Classe LoginModule
/// Responsavel por instanciar as Injeções de Dependencias
class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        /// Dependencia do AuthRepository
        Bind.lazySingleton<AuthRepository>(
          (i) => AuthRepositoryImpl(i()),
        ),

        /// Dependencia do LoginService
        Bind.lazySingleton<LoginService>(
          (i) => LoginServiceImpl(i(), i()),
        ),

        /// Dependencia do LoginController
        Bind.lazySingleton(
          (i) => LoginController(i()),
        ),
      ];

  /// Rota de Login
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
      ];
}
