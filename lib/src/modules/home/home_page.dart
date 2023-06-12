import 'package:flutter/material.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';

/// Classe HomePage()
/// Responsavel por carregar a Página Home
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Testar se o app está obtendo o valor da variável no arquivo .env
      // child: Text(Env.instance.get('backend_base_url')),
      // Para testar o helper size_extensions
      // child: Text(context.screenWidth.toString()),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Login'),
                  ),
                  validator: (String) => 'Erro',
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Botão'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
