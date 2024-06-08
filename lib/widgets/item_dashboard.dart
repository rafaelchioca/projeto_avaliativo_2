import 'package:flutter/material.dart';

class ItemDashboard extends StatelessWidget {
  final String titulo;
  final VoidCallback onTap;
  final Color color;
  final IconData icone;

  const ItemDashboard({
    super.key,
    required this.titulo,
    required this.onTap,
    required this.color,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      color: color,
      child: ListTile(
        leading: Icon(
          icone,
          color: Colors.white,
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
