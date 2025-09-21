import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final favoritosProvider = StateNotifierProvider<FavoritosNotifier, List<Map<String, dynamic>>>(
  (ref) => FavoritosNotifier(),
);

class FavoritosNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  FavoritosNotifier() : super([]) {
    _loadFavoritosFirestore();
  }

  /// Agrega o quita un personaje de favoritos
  Future<void> toggleFavorito(Map<String, dynamic> personaje) async {
    final existe = state.any((p) => p['nombre'] == personaje['nombre']);
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final docRef = FirebaseFirestore.instance
        .collection('favoritos')
        .doc(user.uid)
        .collection('personajes')
        .doc(personaje['nombre']);

    if (existe) {
      state = state.where((p) => p['nombre'] != personaje['nombre']).toList();
      await docRef.delete(); // Elimina el favorito de Firestore
    } else {
      state = [...state, personaje];
      await docRef.set(personaje); // Guarda el nuevo favorito
    }
  }

  /// Carga los favoritos del usuario actual desde Firestore
  Future<void> _loadFavoritosFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('favoritos')
        .doc(user.uid)
        .collection('personajes')
        .get();

    final data = snapshot.docs.map((doc) => doc.data()).toList();
    state = data.cast<Map<String, dynamic>>();
  }
}
