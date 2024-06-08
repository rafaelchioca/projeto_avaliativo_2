import 'package:projeto_avaliativo_2/models/Filme.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase() async {
  final dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'filme.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(
        'CREATE TABLE filmes('
        'id INTEGER PRIMARY KEY, '
        'nome TEXT, '
        'genero TEXT, '
        'duracao INTEGER, '
        'premio BOOLEAN, '
        'ator_coajuvante TEXT, '
        'atriz_coajuvante TEXT'
        ')',
      );
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<int> save(Filme filme) async {
  final db = await createDatabase();
  final Map<String, dynamic> filmeMap = {
    'nome': filme.nome,
    'genero': filme.genero,
    'duracao': filme.duracao,
    'premio': filme.premio ? 1 : 0, 
    'ator_coajuvante': filme.atorCoadjuvante,
    'atriz_coajuvante': filme.atrizCoadjuvante,
  };
  return db.insert('filmes', filmeMap); 
}

Future<List<Filme>> findAll() async {
  final db = await createDatabase();
  final List<Map<String, dynamic>> maps = await db.query('filmes'); 
  final List<Filme> filmes = [];
  for (Map<String, dynamic> map in maps) {
    final Filme filme = Filme(
      id: map['id'],
      nome: map['nome'],
      genero: map['genero'],
      duracao: map['duracao'],
      premio: map['premio'] == 1,
      atorCoadjuvante: map['ator_coajuvante'],
      atrizCoadjuvante: map['atriz_coajuvante'],
    );
    filmes.add(filme);
  }
  return filmes;
}
