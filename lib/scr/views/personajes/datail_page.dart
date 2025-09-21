import 'package:flutter/material.dart';
import 'package:onepiece/scr/animations/fade_animation.dart'; // Animación de aparición
import 'package:onepiece/scr/widgets/blur_container.dart'; 
import 'package:onepiece/scr/widgets/infotitle_widget.dart'; 

// Esta es la pantalla de detalle que se muestra cuando se selecciona un personaje.
// Muestra su imagen, nombre, descripción y otros datos con un diseño atractivo.
class DetallePage extends StatefulWidget {
  const DetallePage({
    super.key,
    required this.color,
    required this.image,
    required this.nombre,
    required this.descripcion, // Se usa para mostrar información del personaje
  });

  final int color; // Color principal de fondo (dinámico según el personaje)
  final String image; // Ruta de la imagen del personaje
  final String nombre; // Nombre del personaje
  final String descripcion; // Descripción del personaje

  @override
  State<DetallePage> createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  double alturadepantalla = 0;

  @override
  Widget build(BuildContext context) {
    // Captura la altura de la pantalla para usarla dinámicamente
    alturadepantalla = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        // Fondo con un degradado que inicia en el color del personaje y termina en negro
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(widget.color), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Imagen del personaje con animación Hero (transición visual suave)
                  Container(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: SizedBox(
                      height: alturadepantalla * .6,
                      child: Hero(
                        tag: widget.color,
                        child: Image.asset(widget.image),
                      ),
                    ),
                  ),
                  // Contenedor con el nombre del personaje y efecto de desenfoque
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: FadeAnimation(
                      intervalEnd: 0.8,
                      child: BlurContainer(
                        child: Container(
                          width: 160,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Text(
                            widget.nombre,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              // Título con nombre del personaje
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FadeAnimation(
                  intervalStart: 0.3,
                  child: Text(
                    "${widget.nombre} #personaje",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              // Texto secundario indicando que pertenece a One Piece
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: FadeAnimation(
                  intervalStart: 0.35,
                  child: Text(
                    "One Piece",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Descripción del personaje
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FadeAnimation(
                  intervalStart: 0.4,
                  child: Text(
                    widget.descripcion,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Datos del creador del anime y su país de origen
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FadeAnimation(
                  intervalStart: 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Infotitle(title: "Eiichirō Oda", subtitle: "Creador"),
                      Infotitle(title: "Japón", subtitle: "País"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Botón para volver atrás
              FadeAnimation(
                intervalStart: 0.5,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context), // Regresa a la pantalla anterior
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(widget.color),
                    ),
                    child: const Text(
                      "Volver",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
