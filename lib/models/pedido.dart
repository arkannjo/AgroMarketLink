import 'package:agro_market_link/models/carrinho.dart';
import 'package:agro_market_link/models/itempedido.dart';


class Pedido {
  final String id;
  final List<ItemPedido> itens;
  final String idComprador;
  final DateTime dataPedido;

  double get valorTotal => itens.fold(0.0, (total, item) => total + item.valorTotal);
  List<String> get idsProdutores => itens.map((item) => item.produtorId).toSet().toList();

  // Construtor padrão
  Pedido({
    required this.id,
    required this.itens,
    required this.idComprador,
    required this.dataPedido,
  });

  Pedido.fromCarrinho(Carrinho carrinho, String orderId, DateTime orderDate)
      : id = orderId,
        itens = List.from(carrinho.itens),
        idComprador = carrinho.idComprador,
        dataPedido = orderDate;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itens': itens.map((item) => item.toMap()).toList(),
      'valorTotal': valorTotal,
      'idComprador': idComprador,
      'idsProdutores': idsProdutores,
      'dataPedido': dataPedido.toIso8601String(),
    };
  }

  static Pedido fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'],
      itens: (map['itens'] as List).map((itemMap) => ItemPedido.fromMap(itemMap)).toList(),
      idComprador: map['idComprador'],
      dataPedido: DateTime.parse(map['dataPedido']),
    );
  }
}
