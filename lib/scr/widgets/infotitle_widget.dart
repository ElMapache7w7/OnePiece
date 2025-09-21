import 'package:flutter/material.dart';

// Este widget personalizado muestra un título y un subtítulo, alineados a la izquierda.
// Se usa en varias partes de la app para mostrar información de forma clara y ordenada.
class Infotitle extends StatelessWidget {
  // Constructor que recibe los textos del título y el subtítulo
  const Infotitle({
    super.key,
    required this.title,     
    required this.subtitle,   
  });

  // Variables finales que almacenan los textos
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column( // Organiza los textos verticalmente
      crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido a la izquierda
      children: [
        Text(
          title, // Muestra el texto principal (título)
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Color blanco para destacar el título
          ),
        ),
        const SizedBox(height: 5), // Espacio entre el título y el subtítulo
        Text(
          subtitle, // Muestra el texto secundario (subtítulo)
          style: const TextStyle(
            color: Colors.white70, // Un tono blanco más suave para no opacar el título
          ),
        ),
      ],
    );
  }
}
