import 'dart:convert';

import 'package:consumo_api/components/usuario_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> pegarUsuarios() async {
    var url =
        Uri.parse('https://jsonplaceholder.typicode.com/users'); //Vem já o http
    var response = await http.get(url); //O HTTP irá buscar as infomações da url
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Erro ao carregar dados do servidor');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6651E),
        title: const Center(child: Text('Consumindo API - Usuários')),
      ),
      body: FutureBuilder<List>(
          future: pegarUsuarios(),
          builder: (context, snapshot) {
            //Isso é um construtor
            if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar Usuários'),
              );
            }

            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount:
                      snapshot.data!.length, //Trás a lista do tamanho que ela é
                  itemBuilder: (context, index) {
                    var usuario = snapshot.data![index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.black26,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            usuario['name'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(usuario['phone']),
                          trailing: Text(usuario['username']),
                          onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UsuarioPage(usuario: usuario),
                                  ),
                                ),
                              }),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 5.0,
                color: Colors.pink,
              ),
            );
          }),
    );
  }
}
