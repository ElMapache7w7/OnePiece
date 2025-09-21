import 'package:cloud_firestore/cloud_firestore.dart';

class Publicacion {
  final String id;
  final String titulo;
  final String contenido;
  final String autorId;
  final Timestamp fecha;

  Publicacion({
    required this.id,
    required this.titulo,
    required this.contenido,
    required this.autorId,
    required this.fecha,
  });

  factory Publicacion.fromMap(String id, Map<String, dynamic> data) {
    return Publicacion(
      id: id,
      titulo: data['titulo'] ?? '',
      contenido: data['contenido'] ?? '',
      autorId: data['autorId'] ?? '',
      fecha: data['fecha'] ?? Timestamp.now(),
    );
  }
}
