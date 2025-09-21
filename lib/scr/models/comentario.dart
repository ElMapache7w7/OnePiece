import 'package:cloud_firestore/cloud_firestore.dart';


class Comentario {
  final String id;
  final String publicacionId;
  final String autorId;
  final String contenido;
  final DateTime fecha;

  Comentario({
    required this.id,
    required this.publicacionId,
    required this.autorId,
    required this.contenido,
    required this.fecha,
  });

  factory Comentario.fromMap(String id, Map<String, dynamic> data) {
    return Comentario(
      id: id,
      publicacionId: data['publicacionId'] ?? '',
      autorId: data['autorId'] ?? '',
      contenido: data['contenido'] ?? '',
      fecha: (data['fecha'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'publicacionId': publicacionId,
      'autorId': autorId,
      'contenido': contenido,
      'fecha': fecha,
    };
  }
}
