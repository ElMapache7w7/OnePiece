import 'package:flutter/material.dart';

class CentroDeAyudaPage extends StatelessWidget {
  const CentroDeAyudaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171717),
      appBar: AppBar(
        title: const Text('Centro de Ayuda'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¿Cómo usar la app?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '📝 **Bienvenido a One Piece Wiki!**\n'
              'Esta app te permitirá conocer más sobre el mundo de One Piece, sus personajes y mucho más. Aquí tienes una guía básica para navegarla:',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            const Text(
              '🔎 **Explorar personajes:**\n'
              'En la pantalla principal, podrás ver una lista de personajes de One Piece. Al hacer clic sobre un personaje, se abrirá una página con más detalles sobre él.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            const Text(
              '⚙️ **Configuración:**\n'
              'En la sección de configuración, puedes acceder a varias opciones, como conocer más sobre la app, monetización y otras opciones útiles.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            const Text(
              '📢 **Noticias:**\n'
              'Mantente al tanto de las últimas novedades sobre One Piece directamente desde nuestra sección de noticias.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            const Text(
              '💬 **Soporte:**\n'
              'Si tienes alguna duda o necesitas ayuda, no dudes en ponerte en contacto con nuestro soporte en la sección correspondiente.',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
