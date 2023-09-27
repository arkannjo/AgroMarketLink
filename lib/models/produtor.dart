import 'pessoa.dart';

enum MetodoCultivo { organico, convencional }

class Produto {
  String descricao;
  double preco;
  int quantidade;

  Produto({
    required this.descricao,
    required this.preco,
    required this.quantidade,
  });

  Produto.fromMap(Map<String, dynamic> map)
      : descricao = map['descricao'],
        preco = map['preco'],
        quantidade = map['quantidade'];

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'preco': preco,
      'quantidade': quantidade,
    };
  }
}

class Produtor extends Pessoa {
  List<Produto> produtosCultivados = [];
  MetodoCultivo metodoCultivo;

  Produtor({
    required String id,
    required String nome,
    required String endereco,
    required String telefone,
    required String email,
    required this.metodoCultivo,
  }) : super(id: id, nome: nome, endereco: endereco, telefone: telefone, email: email);

  Produtor.fromMap(Map<String, dynamic> map)
      : metodoCultivo = map['metodoCultivo'] == 'organico' ? MetodoCultivo.organico : MetodoCultivo.convencional,
        super.fromMap(map);

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      'metodoCultivo': metodoCultivo == MetodoCultivo.organico ? 'organico' : 'convencional',
    });
    return map;
  }
}
