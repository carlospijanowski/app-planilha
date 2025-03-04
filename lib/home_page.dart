import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'widget_catalog.dart';
import 'new_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  // Função para abrir a galeria ou câmera
  Future<void> _pickImage(ImageSource source) async {
    final XFile? selected = await _picker.pickImage(source: source);
    if (selected != null) {
      setState(() {
        _image = File(selected.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Nome do Usuário"),
              accountEmail: Text("email@exemplo.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? Icon(Icons.camera_alt, size: 24.0)
                    : null,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Carregar da Galeria'),
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.of(context).pop(); // Fecha o drawer após a escolha
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Tirar Foto'),
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.of(context).pop(); // Fecha o drawer após a escolha
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Página Inicial'),
              onTap: () {
                Navigator.of(context).pop(); // Fecha o drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.widgets),
              title: Text('Exemplos de Widgets'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WidgetCatalog()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.new_releases),
              title: Text('Nova Tela'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Você pressionou o botão tantas vezes:'),
          ],
        ),
      ),
    );
  }
}
