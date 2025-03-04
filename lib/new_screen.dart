import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tela'),
      ),
      body: Center(
        child: Text(
          'Bem-vindo à Nova Tela!',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
