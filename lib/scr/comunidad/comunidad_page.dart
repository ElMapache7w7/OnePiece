import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../providers/publicaciones_provider.dart';
import '../services/publicacion_service.dart';


class ComunidadPage extends ConsumerStatefulWidget {
  const ComunidadPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ComunidadPage> createState() => _ComunidadPageState();
}

class _ComunidadPageState extends ConsumerState<ComunidadPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();

  @override
  void dispose() {
    _tituloController.dispose();
    _contenidoController.dispose();
    super.dispose();
  }

  Future<void> _publicar() async {
    if (_formKey.currentState!.validate()) {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Debes iniciar sesión para publicar.')),
        );
        return;
      }

      await agregarPublicacion(
        titulo: _tituloController.text,
        contenido: _contenidoController.text,
        autorId: user.uid,
      );

      _tituloController.clear();
      _contenidoController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final publicacionesAsync = ref.watch(publicacionesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comunidad One Piece'),
      ),
      body: Column(
        children: [
          // Formulario de publicación
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _tituloController,
                    decoration: const InputDecoration(
                      labelText: 'Título del episodio',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Ingrese un título' : null,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _contenidoController,
                    decoration: const InputDecoration(
                      labelText: 'Tu opinión',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Ingrese su opinión' : null,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _publicar,
                    child: const Text('Publicar'),
                  ),
                ],
              ),
            ),
          ),

          const Divider(),

          // Lista de publicaciones
          Expanded(
            child: publicacionesAsync.when(
              data: (publicaciones) => publicaciones.isEmpty
                  ? const Center(child: Text('Aún no hay publicaciones.'))
                  : ListView.builder(
                      itemCount: publicaciones.length,
                      itemBuilder: (context, index) {
                        final pub = publicaciones[index];
                        final DateTime fecha = pub.fecha.toDate().toLocal();
                        final String fechaFormateada =
                            DateFormat('dd/MM/yyyy – HH:mm').format(fecha);

                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: ListTile(
                            title: Text(pub.titulo),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(pub.contenido),
                                const SizedBox(height: 6),
                                Text(
                                  'Publicado el $fechaFormateada',
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
