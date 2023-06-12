import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/storage.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
import '../../repositories/payment_type/payment_type_repository_impl.dart';
import '../../repositories/products/product_repository.dart';
import '../../repositories/products/product_repository_impl.dart';
import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';

/// Classe CoreModule
/// Reponsavel por carregar dos os modulos do aplicativo
class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        /// Inicializando as Sessões
        Bind.lazySingleton<Storage>((i) => SessionStorage(), export: true),

        /// Inicializando as conexões com o servidor
        Bind.lazySingleton((i) => CustomDio(i()), export: true),
        Bind.lazySingleton<PaymentTypeRepository>(
          (i) => PaymentTypeRepositoryImpl(i()),
          export: true,
        ),
        Bind.lazySingleton<ProductRepository>(
          (i) => ProductRepositoryImpl(i()),
          export: true,
        ),
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(i()),
          export: true,
        ),
      ];
}
