import 'package:flutter/material.dart';

class NoticiasPage extends StatelessWidget {
  const NoticiasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171717),
      appBar: AppBar(
        title: const Text('Noticias de One Piece'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            'Últimas Noticias',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '📰 ¡Nuevo capítulo del manga revelado!\nEl capítulo 1109 ha sido lanzado y revela más secretos sobre Joy Boy.',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          Text(
            '🌀 Teoría del Gear 6\nFans especulan sobre una nueva transformación de Luffy después del Gear 5.',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          Text(
            '🎬 Nueva película anunciada\nToei Animation confirma que una nueva película de One Piece está en producción.',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          Text(
            '🌊 El arco de Elbaf se acerca\nOda confirma que la historia se moverá pronto hacia Elbaf, la tierra de los gigantes.',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          Text(
            '📦 Nuevas figuras coleccionables\nBandai lanza figuras exclusivas de la saga de Wano.',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          Text(
            '🎤 Entrevista con Oda\nOda habla sobre el final de One Piece: "Será algo que nunca se ha visto antes".',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          Text(
            '📺 Serie Live-Action\nNetflix confirma segunda temporada de la serie live-action con nuevos personajes.',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          Text(
            '🎉 Aniversario de One Piece\nCelebraciones por el 25 aniversario del manga alrededor del mundo.',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          Text(
            '💥 ¿Regresa Enel?\nNuevas pistas en el manga sugieren que Enel podría volver a la historia principal.',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          Text(
            '📊 Ranking de popularidad\nZoro lidera el ranking global de personajes favoritos, seguido de cerca por Luffy y Sanji.',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
          Text(
            '🗺️ Nuevo mapa interactivo\nUn sitio oficial lanza un mapa del mundo de One Piece con datos de cada isla.',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
