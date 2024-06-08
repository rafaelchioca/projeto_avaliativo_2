import 'package:flutter/material.dart';
import 'package:projeto_avaliativo_2/models/Filme.dart';
import 'package:projeto_avaliativo_2/screens/detalhes_filme.dart';
import 'package:projeto_avaliativo_2/screens/formulario_filme.dart';
import 'package:projeto_avaliativo_2/widgets/item_filme.dart';
import 'package:projeto_avaliativo_2/database/app_database.dart';

class ListaFilmes extends StatefulWidget {
  const ListaFilmes({super.key});

  @override
  _ListaFilmesState createState() => _ListaFilmesState();
}

class _ListaFilmesState extends State<ListaFilmes> {
  late Future<List<Filme>> _filmesFuture;

  @override
  void initState() {
    super.initState();
    _filmesFuture = _loadFilmes();
  }

  Future<List<Filme>> _loadFilmes() async {
    return await findAll();
  }

  void _refreshFilmes() {
    setState(() {
      _filmesFuture = _loadFilmes();
    });
  }

  void _handleTap(Filme filme) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FilmeDetalhesPage(filme: filme),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 222, 17, 44),
        foregroundColor: Colors.white,
        title: const Text(
          'Lista de Filmes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<Filme>>(
        initialData: const [],
        future: _filmesFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando..."),
                  ],
                ),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              }
              final List<Filme> filmes = snapshot.data ?? [];
              if (filmes.isEmpty) {
                return const Center(child: Text('Nenhum filme cadastrado!'));
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Filme filme = filmes[index];
                  return ItemFilme(
                    filme: filme,
                    onTap: () => _handleTap(filme),
                  );
                },
                itemCount: filmes.length,
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 222, 17, 44),
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => FilmeFormPage(),
            ),
          )
              .then((_) => _refreshFilmes());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35.0,
        ),
      ),
    );
  }
}
