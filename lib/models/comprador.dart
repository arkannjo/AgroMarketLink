import 'pessoa_fisica.dart';
import 'pessoa_juridica.dart';

enum TipoComprador { restaurante, pessoaFisica, mercado }

class Comprador {
  final TipoComprador tipoComprador;
  final dynamic perfil;  // Pode ser uma PessoaFisica ou PessoaJuridica

  Comprador({
    required this.tipoComprador,
    required this.perfil,
  });

  // Conversão para/from map
  Map<String, dynamic> toMap() {
    if (perfil is PessoaFisica) {
      return {
        'tipoComprador': tipoComprador.index,
        'perfil': (perfil as PessoaFisica).toMap(),
      };
    } else {
      return {
        'tipoComprador': tipoComprador.index,
        'perfil': (perfil as PessoaJuridica).toMap(),
      };
    }
  }

  static Comprador fromMap(Map<String, dynamic> map) {
    TipoComprador tipo = TipoComprador.values[map['tipoComprador']];
    dynamic perfil;
    if (map['perfil'].containsKey('cpf')) {
      perfil = PessoaFisica.fromMap(map['perfil']);
    } else {
      perfil = PessoaJuridica.fromMap(map['perfil']);
    }

    return Comprador(
      tipoComprador: tipo,
      perfil: perfil,
    );
  }
}
