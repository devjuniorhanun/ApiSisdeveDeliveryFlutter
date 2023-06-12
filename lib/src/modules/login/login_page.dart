import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';
import 'login_controller.dart';

/// Classe LoginPage()
/// Reponsavel por criar a página de login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loader, Messages {
  /// Criando variáveis
  /// Recebe o campo de email
  final emailEC = TextEditingController();

  /// Recebe o campo de senha
  final passwordEC = TextEditingController();

  /// Recebe uma chave de formulario
  final formKey = GlobalKey<FormState>();

  /// Instancia o LoginController
  final controller = Modular.get<LoginController>();

  /// Variavel que escuta os status da tela
  late final ReactionDisposer statusReactionDisposer;

  /// Método para escutar as alterações na tela
  @override
  void initState() {
    /// Verifica os status da tela
    statusReactionDisposer = reaction((_) => controller.loginStatus, (status) {
      switch (status) {
        /// Status incial
        case LoginStateStatus.initial:
          // TODO: Handle this case.
          break;

        /// Status de loadgin
        case LoginStateStatus.loading:

          /// Abre o Loader
          showLoader();
          break;

        /// Status de sucesso
        case LoginStateStatus.success:

          /// Fecha o Loader
          hideLoader();

          /// Muda para a página inicial do aplicativo
          Modular.to.navigate('/');
          break;

        /// Status de error
        case LoginStateStatus.error:
          hideLoader();
          showError(controller.errorMessage ?? 'Erro');
          break;
      }
    });
    super.initState();
  }

  /// Remove as variávies da Memória
  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    statusReactionDisposer();
    super.dispose();
  }

  void _formSubmit() {
    final formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      controller.login(emailEC.text, passwordEC.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Variável que pega o menor tamanho da tela
    final screenShortestSide = context.screenShortestSide;
    final screenWidth = context.screenWidth;
    return Scaffold(
      /*  appBar: AppBar(
        title: const Text('Login'),
      ), */
      backgroundColor: context.colors.black,
      body: Form(
        key: formKey,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            /// Imagem do Lanche que fica no rodape do aplicativo
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                /// Define a altura da imagem
                height: screenShortestSide * .5, // .5 = 50%
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/lanche.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            /// Imagem da logo que fica no topo no aplicativo
            Container(
              width: screenShortestSide * .5,
              padding: EdgeInsets.only(top: context.percentHeight(.10)),
              child: Image.asset('assets/images/logo.png'),
            ),

            /// Cria o Card do Formulário de Login
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth:
                        context.percentWidth(screenWidth < 1300 ? .7 : .3),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FractionallySizedBox(
                        widthFactor: .3,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Login',
                          style: context.textStyles.textTitle,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailEC,
                        onFieldSubmitted: (_) => _formSubmit(),
                        decoration: const InputDecoration(labelText: 'E-mail'),
                        validator: Validatorless.multiple([
                          Validatorless.required(
                            'Informar o e-mail é obrigatório!',
                          ),
                          Validatorless.email('E-mail inválido!'),
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordEC,
                        onFieldSubmitted: (_) => _formSubmit(),
                        obscureText: true,
                        decoration: const InputDecoration(labelText: 'Senha'),
                        validator: Validatorless.required(
                          'Informar a senha é obrigatório!',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            _formSubmit();
                          },
                          child: const Text('Entrar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
