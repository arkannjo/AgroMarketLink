class Produto {
  final String id;
  final String nome;
  final String descricao;

  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
    };
  }

  static Produto fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
    );
  }
}

class OfertaProduto {
  final String id;
  final String produtoId;  // apenas o ID do produto
  final String produtorId; // apenas o ID do produtor
  final double preco;
  final double quantidadeDisponivel;

  OfertaProduto({
    required this.id,
    required this.produtoId,
    required this.produtorId,
    required this.preco,
    required this.quantidadeDisponivel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'produtoId': produtoId,
      'produtorId': produtorId,
      'preco': preco,
      'quantidadeDisponivel': quantidadeDisponivel,
    };
  }

  static OfertaProduto fromMap(Map<String, dynamic> map) {
    return OfertaProduto(
      id: map['id'],
      produtoId: map['produtoId'],
      produtorId: map['produtorId'],
      preco: map['preco'],
      quantidadeDisponivel: map['quantidadeDisponivel'],
    );
  }
}
