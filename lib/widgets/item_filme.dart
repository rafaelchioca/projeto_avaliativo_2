import 'package:flutter/material.dart';
import 'package:projeto_avaliativo_2/models/Filme.dart';

class ItemFilme extends StatelessWidget {
  final Filme filme;
  final VoidCallback onTap;

  const ItemFilme({
    super.key,
    required this.filme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 18, 18, 18),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: const Icon(
          Icons.movie_creation_rounded,
          size: 40,
          color: Colors.white,
        ),
        title: Text(
          filme.nome,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          filme.genero,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        trailing: filme.premio
            ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
