import 'package:agro_market_link/models/produto.dart';



class ItemPedido {
  final OfertaProduto oferta;
  final double quantidade;
  final double valorTotal;

  ItemPedido({
    required this.oferta,
    required this.quantidade,
  }) : valorTotal = oferta.preco * quantidade;

  String get produtorId => oferta.produtorId;

  Map<String, dynamic> toMap() {
    return {
      'oferta': oferta.toMap(),
      'quantidade': quantidade,
      'valorTotal': valorTotal,
    };
  }

  static ItemPedido fromMap(Map<String, dynamic> map) {
    return ItemPedido(
      oferta: OfertaProduto.fromMap(map['oferta']),
      quantidade: map['quantidade'],
    );
  }
}
