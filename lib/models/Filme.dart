class Filme {
  final int? id;
  final String nome;
  final String genero;
  final int duracao;
  final bool premio;
  final String atorCoadjuvante;
  final String atrizCoadjuvante;

  Filme({
    this.id,
    required this.nome,
    required this.genero,
    required this.duracao,
    required this.premio,
    required this.atorCoadjuvante,
    required this.atrizCoadjuvante,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'genero': genero,
      'duracao': duracao,
      'premio': premio ? 1 : 0,
      'atorCoadjuvante': atorCoadjuvante,
      'atrizCoadjuvante': atrizCoadjuvante,
    };
  }

  static fromMap(Map<String, Object?> json) {}
}
