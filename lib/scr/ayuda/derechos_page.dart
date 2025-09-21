import 'package:flutter/material.dart';

class DerechosPage extends StatelessWidget {
  const DerechosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171717),
      appBar: AppBar(
        title: const Text('Derechos'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Derechos de One Piece Wiki',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Esta aplicación no es oficial y no está afiliada con Toei Animation, Eiichiro Oda, Shueisha ni ningún otro propietario oficial de la franquicia One Piece.',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 20),
              Text(
                'Todos los personajes, nombres, imágenes y derechos relacionados con One Piece pertenecen a sus respectivos dueños. Esta app se realiza con fines informativos y de entretenimiento para fans.',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 20),
              Text(
                'Si eres titular de derechos y consideras que se está infringiendo algún contenido, por favor contáctanos para solucionarlo de inmediato.',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
