import 'itempedido.dart';

class Carrinho {
  final String id;
  final String idComprador;
  List<ItemPedido> itens;

  double get valorTotal => itens.fold(0.0, (total, item) => total + item.valorTotal);

  // Extrai a lista de IDs dos produtores dos itens no carrinho
  List<String> get idsProdutores => itens.map((item) => item.produtorId).toSet().toList();


  Carrinho({
    required this.id,
    required this.idComprador,
    this.itens = const [],
  });

  void adicionarItem(ItemPedido item) {
    itens.add(item);
  }

  void removerItem(ItemPedido item) {
    itens.remove(item);
  }
}
