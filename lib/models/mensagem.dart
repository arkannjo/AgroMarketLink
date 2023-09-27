class Mensagem {
  final String id;
  final String idSender; // ID de quem envia a mensagem
  final String idReceiver; // ID de quem recebe a mensagem
  final String texto;
  final DateTime dataEnvio;

  Mensagem({
    required this.id,
    required this.idSender,
    required this.idReceiver,
    required this.texto,
    required this.dataEnvio,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idSender': idSender,
      'idReceiver': idReceiver,
      'texto': texto,
      'dataEnvio': dataEnvio.toIso8601String(),
    };
  }

  static Mensagem fromMap(Map<String, dynamic> map) {
    return Mensagem(
      id: map['id'],
      idSender: map['idSender'],
      idReceiver: map['idReceiver'],
      texto: map['texto'],
      dataEnvio: DateTime.parse(map['dataEnvio']),
    );
  }
}
