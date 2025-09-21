import 'package:flutter/material.dart';

// Este widget permite animar la opacidad de cualquier otro widget,
// haciendo que aparezca poco a poco con un efecto "fade in".
class FadeAnimation extends StatelessWidget {
  const FadeAnimation({
    super.key,
    required this.child, // Widget hijo que será animado
    this.begin = 0, // Opacidad inicial (0 = invisible)
    this.end = 1, // Opacidad final (1 = completamente visible)
    this.intervalStart = 0, // Punto de inicio del intervalo de animación
    this.intervalEnd = 1, // Punto de fin del intervalo
    this.duration = const Duration(milliseconds: 3000), // Duración total
    this.curve = Curves.fastOutSlowIn, // Curva de animación
  });

  final double begin;
  final double end;
  final Duration duration;
  final double intervalStart;
  final double intervalEnd;
  final Curve curve;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      // Se define el rango de opacidad que cambiará con el tiempo
      tween: Tween<double>(begin: begin, end: end),
      duration: duration,
      // Intervalo para controlar en qué parte del tiempo inicia y termina
      curve: Interval(intervalStart, intervalEnd, curve: curve),
      child: child,
      builder: (BuildContext context, double? value, Widget? child) {
        // Se aplica el valor de opacidad al widget hijo
        return Opacity(
          opacity: value!,
          child: child,
        );
      },
    );
  }
}
