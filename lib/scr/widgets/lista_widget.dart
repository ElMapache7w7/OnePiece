import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../views/personajes/datail_page.dart';
import '../providers/favoritos_provider.dart';

class Listapersonajes extends ConsumerStatefulWidget {
  final List<Map<String, dynamic>> personajes;

  const Listapersonajes({
    super.key,
    required this.personajes,
  });

  @override
  ConsumerState<Listapersonajes> createState() => _ListapersonajesState();
}

class _ListapersonajesState extends ConsumerState<Listapersonajes> {
  String categoriaSeleccionada = "Todos";

  final List<String> categorias = [
    "Todos",
    "Sombrero de Paja",
    "Marina",
    "Revolucionarios",
    "Yonkou",
    "Shichibukai",
    "CP9",
    "Otros",
  ];

  @override
  Widget build(BuildContext context) {
    final favoritos = ref.watch(favoritosProvider);
    double widthpantalla = MediaQuery.of(context).size.width - 50;

    final tituloStyletext = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    final personajesFiltrados = categoriaSeleccionada == "Todos"
        ? widget.personajes
        : widget.personajes
            .where((p) => p["categoria"] == categoriaSeleccionada)
            .toList();

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text("Portadas", style: tituloStyletext),
          const SizedBox(height: 15),
          Row(
            children: [
              bloquesPortada("p1.jpg", "titulo: ", "2018", widthpantalla),
              SizedBox(width: widthpantalla * .03),
              bloquesPortada("p2.jpg", "titulo: ", "2022", widthpantalla),
              SizedBox(width: widthpantalla * .03),
              bloquesPortada("p3.jpg", "titulo: ", "2023", widthpantalla),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 62, 62, 62),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categorias.map((categoria) {
                final bool isSelected = categoria == categoriaSeleccionada;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    label: Text(
                      categoria,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: Colors.amberAccent,
                    backgroundColor: const Color.fromARGB(255, 44, 44, 44),
                    onSelected: (_) {
                      setState(() {
                        categoriaSeleccionada = categoria;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          ...personajesFiltrados.map((personaje) => bloquePersonajes(
                context,
                personaje,
                favoritos.any((p) => p["nombre"] == personaje["nombre"]),
              )),
        ],
      ),
    );
  }

  Widget bloquePersonajes(
      BuildContext context, Map<String, dynamic> personaje, bool esFavorito) {
    final nombre = personaje['nombre'];
    final color = personaje['color'];
    final imagen = personaje['imagen'];
    final descripcion = personaje['descripcion'];

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => DetallePage(
            color: color,
            image: "assets/$imagen.png",
            nombre: nombre,
            descripcion: descripcion,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        offset: const Offset(0, 5),
                        color: Color(color),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Hero(
                    tag: color,
                    child: Image.asset("assets/$imagen.png"),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  nombre,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
            IconButton(
              icon: Icon(
                esFavorito ? Icons.favorite : Icons.favorite_border,
                color: esFavorito ? Colors.red : Colors.white,
              )
                  .animate(
                    target: esFavorito ? 1 : 0,
                    onPlay: (controller) => controller.forward(from: 0),
                  )
                  .scale(
                    begin: const Offset(1.0, 1.0),
                    end: const Offset(1.3, 1.3),
                    duration: 300.ms,
                    curve: Curves.easeOut,
                  ),
              onPressed: () {
                ref
                    .read(favoritosProvider.notifier)
                    .toggleFavorito(personaje);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget bloquesPortada(
      String image, String titulo, String subtitulo, double widthpantalla) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            "assets/$image",
            width: widthpantalla * .31,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 15),
        RichText(
          text: TextSpan(
            text: titulo,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
            children: [
              TextSpan(
                text: subtitulo,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
