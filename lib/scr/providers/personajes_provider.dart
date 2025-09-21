import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'busqueda_provider.dart';

final _todosLosPersonajes = [
  {
    "nombre": "Brook",
    "color": 0xff4913C4,
    "imagen": "o1",
    "descripcion": "Brook es el músico...",
    "categoria": "Sombrero de Paja",
  },
  {
    "nombre": "Luffy",
    "color": 0xffF82A2D,
    "imagen": "o2",
    "descripcion": "Monkey D. Luffy es el capitán...",
    "categoria": "Sombrero de Paja",
  },
  {
    "nombre": "Portgas D. Ace",
    "color": 0xffFFCB28,
    "imagen": "o3",
    "descripcion": "Ace es el hermano de Luffy...",
    "categoria": "Revolucionarios",
  },
  {
    "nombre": "Boa Hancock",
    "color": 0xffFE4649,
    "imagen": "o4",
    "descripcion": "Boa Hancock es la emperatriz...",
    "categoria": "Shichibukai",
  },
  {
    "nombre": "Nami",
    "color": 0xffDF1C6A,
    "imagen": "o5",
    "descripcion": "Nami es la navegante...",
    "categoria": "Sombrero de Paja",
  },
  {
    "nombre": "Roronoa Zoro",
    "color": 0xff21E295,
    "imagen": "o6",
    "descripcion": "Zoro es el espadachín...",
    "categoria": "Sombrero de Paja",
  },
];

final personajesProvider = Provider<List<Map<String, dynamic>>>((ref) {
  final terminoBusqueda = ref.watch(terminoBusquedaProvider);

  if (terminoBusqueda.isEmpty) {
    return _todosLosPersonajes;
  }

  return _todosLosPersonajes.where((personaje) {
    final nombre = personaje['nombre'].toString().toLowerCase();
    return nombre.contains(terminoBusqueda.toLowerCase());
  }).toList();
});
