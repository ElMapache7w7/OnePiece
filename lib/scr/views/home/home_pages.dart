import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:onepiece/scr/widgets/header_widget.dart';
import 'package:onepiece/scr/widgets/lista_widget.dart';
import 'package:onepiece/scr/noticias/noticias_page.dart';
import 'package:onepiece/scr/configuracion/configuracion_page.dart';
import 'package:onepiece/scr/historias/historias_page.dart';
import 'package:onepiece/scr/favoritos/favoritos_page.dart';
import 'package:onepiece/scr/views/auth/login_page.dart';
import 'package:onepiece/scr/views/auth/register_page.dart';
import 'package:onepiece/scr/perfil/perfil_page.dart';
import 'package:onepiece/scr/comunidad/comunidad_page.dart'; 
import 'package:onepiece/scr/providers/personajes_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personajes = ref.watch(personajesProvider);

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 16, 16, 16),
          body: Column(
            children: <Widget>[
              Headerwidget(personajes: personajes),
              Listapersonajes(personajes: personajes),
            ],
          ),
          floatingActionButton: SpeedDial(
            icon: Icons.menu,
            activeIcon: Icons.close,
            backgroundColor: const Color.fromARGB(255, 95, 25, 208),
            foregroundColor: Colors.white,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.article, color: Colors.white),
                backgroundColor: Colors.blue,
                label: 'Noticias',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NoticiasPage()),
                  );
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.settings, color: Colors.white),
                backgroundColor: Colors.green,
                label: 'Configuración',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ConfiguracionPage()),
                  );
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.book, color: Colors.white),
                backgroundColor: Colors.orange,
                label: 'Historias',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HistoriasPage()),
                  );
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.favorite, color: Colors.white),
                backgroundColor: Colors.pink,
                label: 'Favoritos',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const FavoritosPage()),
                  );
                },
              ),

              // ✅ Comunidad: visible solo si hay sesión
              if (user != null)
                SpeedDialChild(
                  child: const Icon(Icons.forum, color: Colors.white),
                  backgroundColor: Colors.redAccent,
                  label: 'Comunidad',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ComunidadPage()),
                    );
                  },
                ),

              // ✅ Perfil si hay sesión
              if (user != null)
                SpeedDialChild(
                  child: const Icon(Icons.person, color: Colors.white),
                  backgroundColor: Colors.deepPurple,
                  label: 'Perfil',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const PerfilPage()),
                    );
                  },
                ),

              // ❌ Mostrar solo si NO hay sesión
              if (user == null) ...[
                SpeedDialChild(
                  child: const Icon(Icons.login, color: Colors.white),
                  backgroundColor: Colors.teal,
                  label: 'Login',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
                SpeedDialChild(
                  child: const Icon(Icons.person_add, color: Colors.white),
                  backgroundColor: Colors.indigo,
                  label: 'Registro',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
