import 'package:cloud_firestore/cloud_firestore.dart';

class Mensagem {
  final String? id; // Agora é opcional
  final String idSender;
  final String idReceiver;
  final String texto;
  final DateTime dataEnvio;

  Mensagem({
    this.id,
    required this.idSender,
    required this.idReceiver,
    required this.texto,
    required this.dataEnvio,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'idSender': idSender,
      'idReceiver': idReceiver,
      'texto': texto,
      'dataEnvio': Timestamp.fromDate(dataEnvio), // Convertendo para Timestamp
    };
  }

  static Mensagem fromMap(Map<String, dynamic> map) {
    return Mensagem(
      id: map['id'],
      idSender: map['idSender'],
      idReceiver: map['idReceiver'],
      texto: map['texto'],
      dataEnvio: (map['dataEnvio'] as Timestamp).toDate(), // Convertendo de Timestamp para DateTime
    );
  }
}
