class Pessoa {
  String id;
  String nome;
  String endereco;
  String telefone;
  String email;

  Pessoa({
    required this.id,
    required this.nome,
    required this.endereco,
    required this.telefone,
    required this.email,
  });

  // Converter de mapa para objeto
  Pessoa.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        nome = map['nome'],
        endereco = map['endereco'],
        telefone = map['telefone'],
        email = map['email'];

  // Converter de objeto para mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'endereco': endereco,
      'telefone': telefone,
      'email': email,
    };
  }
}
