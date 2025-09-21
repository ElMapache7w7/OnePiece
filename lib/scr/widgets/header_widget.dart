import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onepiece/scr/providers/busqueda_provider.dart';

class Headerwidget extends ConsumerWidget {
  final List<Map<String, dynamic>> personajes;
  const Headerwidget({super.key, required this.personajes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 170.0,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2C0A4A), // Morado oscuro
            Color(0xFF1A1A1A), // Negro elegante
            Color(0xFF710000), // Rojo intenso
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Título y subtítulo
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'ONE PIECE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.redAccent,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
              ),
              Text(
                '¡Encuentra a tu personaje favorito!',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),

          // Íconos de acción (lupa y campana)
          Row(
            children: [
              _buildIconButton(
                icon: Icons.search,
                color: Colors.redAccent,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          onChanged: (valor) {
                            ref.read(terminoBusquedaProvider.notifier).state = valor;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Buscar personaje...',
                            hintStyle: const TextStyle(color: Colors.white54),
                            prefixIcon: const Icon(Icons.search, color: Colors.white70),
                            filled: true,
                            fillColor: Colors.black54,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(width: 12),
              _buildIconButton(
                icon: Icons.notifications,
                color: Colors.blueAccent,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sin notificaciones por ahora'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🔘 Estilo personalizado para los botones de íconos
  Widget _buildIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 26),
        onPressed: onTap,
      ),
    );
  }
}
