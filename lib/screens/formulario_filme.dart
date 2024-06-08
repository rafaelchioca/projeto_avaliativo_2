import 'package:flutter/material.dart';
import 'package:projeto_avaliativo_2/database/app_database.dart';
import 'package:projeto_avaliativo_2/models/Filme.dart';

class FilmeFormPage extends StatefulWidget {
  const FilmeFormPage({super.key});

  @override
  _FilmeFormPageState createState() => _FilmeFormPageState();
}

class _FilmeFormPageState extends State<FilmeFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _genero = '';
  int _duracao = 0;
  bool _premio = false;
  String _atorCoadjuvante = '';
  String _atrizCoadjuvante = '';

  Future<void> _saveFilme() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final filme = Filme(
        id: null,
        nome: _nome,
        genero: _genero,
        duracao: _duracao,
        premio: _premio,
        atorCoadjuvante: _atorCoadjuvante,
        atrizCoadjuvante: _atrizCoadjuvante,
      );
      await save(filme);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 17, 44),
        foregroundColor: Colors.white,
        title: const Text(
          'Cadastrar Filme',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o nome do filme';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nome = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Gênero'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o gênero do filme';
                  }
                  return null;
                },
                onSaved: (value) {
                  _genero = value!;
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Duração (minutos)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty || int.tryParse(value) == null) {
                    return 'Por favor, insira a duração do filme';
                  }
                  return null;
                },
                onSaved: (value) {
                  _duracao = int.parse(value!);
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Ator Coadjuvante'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o nome do ator coadjuvante';
                  }
                  return null;
                },
                onSaved: (value) {
                  _atorCoadjuvante = value!;
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Atriz Coadjuvante'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o nome da atriz coadjuvante';
                  }
                  return null;
                },
                onSaved: (value) {
                  _atrizCoadjuvante = value!;
                },
              ),
              SwitchListTile(
                title: const Text('Possui prêmio?'),
                activeColor: const Color.fromARGB(255, 222, 17, 44),
                activeTrackColor: const Color.fromARGB(255, 18, 18, 18),
                inactiveThumbColor: const Color.fromARGB(255, 222, 17, 44),
                value: _premio,
                onChanged: (value) {
                  setState(() {
                    _premio = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 222, 17, 44),
                  ),
                ),
                onPressed: _saveFilme,
                child: const Text(
                  'Salvar',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
