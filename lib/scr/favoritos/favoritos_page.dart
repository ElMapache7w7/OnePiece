import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece/scr/views/personajes/datail_page.dart';
import 'package:onepiece/scr/providers/favoritos_provider.dart';

class FavoritosPage extends ConsumerWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritos = ref.watch(favoritosProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 40, 39),
        title: const Text("Favoritos"),
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: favoritos.length,
        itemBuilder: (context, index) {
          final personaje = favoritos[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => DetallePage(
                  color: personaje['color'],
                  image: "assets/${personaje['imagen']}.png",
                  nombre: personaje['nombre'],
                  descripcion: personaje['descripcion'],
                ),
              ));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(66, 43, 43, 43),
              ),
              height: 65,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          offset: const Offset(0, 5),
                          color: Color(personaje['color']),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Hero(
                      tag: personaje['color'],
                      child: Image.asset("assets/${personaje['imagen']}.png"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    personaje['nombre'],
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
