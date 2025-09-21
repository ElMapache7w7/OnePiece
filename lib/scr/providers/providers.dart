import 'package:flutter_riverpod/flutter_riverpod.dart';

final saludoProvider = Provider<String>((ref) {
  return "¡Hola desde Riverpod!";
});
