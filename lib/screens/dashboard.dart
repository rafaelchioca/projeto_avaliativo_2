import 'package:flutter/material.dart';
import 'package:projeto_avaliativo_2/widgets/item_dashboard.dart';
import 'package:projeto_avaliativo_2/screens/lista_filme.dart';
import 'package:projeto_avaliativo_2/screens/formulario_filme.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 222, 17, 44),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              'https://archive.org/download/logo-filmes-png-1/logo-filmes-png-1.png',
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          ItemDashboard(
            titulo: 'Lista de Filmes',
            color: const Color.fromARGB(255, 18, 18, 18),
            icone: Icons.list,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListaFilmes()),
              );
            },
          ),
          ItemDashboard(
            titulo: 'Cadastrar Filme',
            color: const Color.fromARGB(255, 18, 18, 18),
            icone: Icons.movie_creation_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FilmeFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
