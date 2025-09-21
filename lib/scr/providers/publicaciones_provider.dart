import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/publicacion.dart';

final publicacionesProvider = StreamProvider<List<Publicacion>>((ref) {
  final stream = FirebaseFirestore.instance
      .collection('publicaciones')
      .orderBy('fecha', descending: true)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      return Publicacion.fromMap(doc.id, doc.data());
    }).toList();
  });

  return stream;
});
