import 'pessoa.dart';
import 'produto.dart';

enum MetodoCultivo { organico, convencional }


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
