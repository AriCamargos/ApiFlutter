import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UsuarioPage extends StatelessWidget {
  Map<String, dynamic> usuario;

  UsuarioPage({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6651E),
        title: Text(usuario['name']),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                (usuario['name']),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                usuario['email'],
                textAlign: TextAlign.center,
              ),
              Text(
                usuario['phone'],
                textAlign: TextAlign.center,
              ),
              Text(
                usuario['address']['street'],
                textAlign: TextAlign.center,
              ),
              Text(
                usuario['address']['suite'],
                textAlign: TextAlign.center,
              ),
              Text(
                usuario['address']['city'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
