import 'pessoa.dart';

class PessoaJuridica extends Pessoa {
  final String cnpj;
  final String razaoSocial;

  PessoaJuridica({
    required String id,
    required String nome,
    required String endereco,
    required String telefone,
    required String email,
    required this.cnpj,
    required this.razaoSocial,
  }) : super(id: id, nome: nome, endereco: endereco, telefone: telefone, email: email);

  // Conversão para/from map
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'cnpj': cnpj,
      'razaoSocial': razaoSocial,
    };
  }

  static PessoaJuridica fromMap(Map<String, dynamic> map) {
    return PessoaJuridica(
      id: map['id'],
      nome: map['nome'],
      endereco: map['endereco'],
      telefone: map['telefone'],
      email: map['email'],
      cnpj: map['cnpj'],
      razaoSocial: map['razaoSocial'],
    );
  }
}
