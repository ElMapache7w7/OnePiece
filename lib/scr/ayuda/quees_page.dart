import 'package:flutter/material.dart';

class QueEsPage extends StatelessWidget {
  const QueEsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171717),
      appBar: AppBar(
        title: const Text('¿Qué es One Piece Wiki?'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: const Text(
          'One Piece Wiki es una aplicación móvil diseñada para los fans del anime y manga One Piece. '
          'Aquí podrás explorar información detallada sobre tus personajes favoritos, ver portadas de capítulos, '
          'leer noticias actualizadas y mucho más. ¡Todo en un solo lugar y con estilo!',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ),
    );
  }
}
