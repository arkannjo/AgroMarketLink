import 'pessoa.dart';

class PessoaFisica extends Pessoa {
  final String cpf;

  PessoaFisica({
    required String id,
    required String nome,
    required String endereco,
    required String telefone,
    required String email,
    required this.cpf,
  }) : super(id: id, nome: nome, endereco: endereco, telefone: telefone, email: email);

  // Conversão para/from map (útil para armazenamento no Firebase)
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'cpf': cpf,
    };
  }

  static PessoaFisica fromMap(Map<String, dynamic> map) {
    return PessoaFisica(
      id: map['id'],
      nome: map['nome'],
      endereco: map['endereco'],
      telefone: map['telefone'],
      email: map['email'],
      cpf: map['cpf'],
    );
  }
}
