import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> agregarPublicacion({
  required String titulo,
  required String contenido,
  required String autorId,
}) async {
  final fecha = Timestamp.now();

  await FirebaseFirestore.instance.collection('publicaciones').add({
    'titulo': titulo,
    'contenido': contenido,
    'autorId': autorId,
    'fecha': fecha,
  });
}
