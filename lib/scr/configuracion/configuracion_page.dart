import 'package:flutter/material.dart';
import 'package:onepiece/scr/ayuda/quees_page.dart';
import 'package:onepiece/scr/configuracion/monetizacion_page.dart';
import 'package:onepiece/scr/ayuda/derechos_page.dart';
import 'package:onepiece/scr/ayuda/centrodeayuda_page.dart';

class ConfiguracionPage extends StatelessWidget {
  const ConfiguracionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171717),
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Opciones',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff252525),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QueEsPage()),
                );
              },
              child: const Text('¿Qué es One Piece Wiki?', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff252525),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MonetizacionPage()),
                );
              },
              child: const Text('Monetización', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff252525),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DerechosPage()),
                );
              },
              child: const Text('Derechos', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff252525),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CentroDeAyudaPage()), // Nuevo botón
                );
              },
              child: const Text('Centro de Ayuda', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
