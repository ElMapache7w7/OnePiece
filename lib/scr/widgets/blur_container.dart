import 'dart:ui'; // Importa funciones para aplicar efectos gráficos como el blur
import 'package:flutter/material.dart';

// Este widget aplica un efecto de desenfoque (blur) al contenido que se le pase como hijo.
// Es útil para darle un estilo moderno y visualmente atractivo a la interfaz.
class BlurContainer extends StatelessWidget {
  const BlurContainer({
    super.key,
    required this.child, // El widget hijo al que se le aplicará el efecto blur
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8), // Esquinas redondeadas del contenedor
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0), // Aplica desenfoque en ambos ejes
        child: child, // El contenido que se desenfoca, como textos o imágenes
      ),
    );
  }
}
