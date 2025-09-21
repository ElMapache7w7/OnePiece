import 'package:flutter/material.dart';

class HistoriasPage extends StatelessWidget {
  const HistoriasPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de personajes para los botones
    final personajes = [
      {
        'nombre': 'Luffy',
        'descripcion': 'Monkey D. Luffy es el protagonista principal de One Piece y el carismático capitán de los Piratas del Sombrero de Paja. Desde muy joven, Luffy se vio inspirado por el pirata Shanks el Pelirrojo, a quien admira profundamente. Su más grande sueño es encontrar el legendario tesoro conocido como One Piece y convertirse en el Rey de los Piratas, un título que representa la libertad absoluta en el mar. Luffy comió la fruta del diablo Gomu Gomu no Mi (más tarde revelada como la Hito Hito no Mi: Modelo Nika), la cual le otorgó un cuerpo de goma que puede estirarse, rebotar y absorber impactos. A pesar de que esto le impide nadar, ha utilizado sus habilidades de manera creativa para desarrollar poderosas técnicas de combate como el Gomu Gomu no Pistol, Gear Second, Gear Third y el impresionante Gear Fifth, que lo transforma en una figura casi mítica. Su personalidad es despreocupada, valiente y completamente impredecible. Aunque a menudo es visto como ingenuo o tonto, Luffy posee un sentido de la justicia inquebrantable y una voluntad de hierro que le permite superar incluso los desafíos más imposibles. Es extremadamente leal a sus amigos y no duda en enfrentarse a poderosos enemigos o gobiernos enteros si eso significa proteger a sus nakamas. A lo largo de su aventura, Luffy ha formado una tripulación única y poderosa, cada uno con sus propias metas y pasados complejos. Juntos, han enfrentado enemigos formidables como la Marina, los Shichibukai, los Yonkō e incluso el Gobierno Mundial. Su legado en el mundo de One Piece ya está marcado por hazañas legendarias: derrotó a Crocodile, Enel, Doflamingo, y ha desafiado a grandes emperadores como Big Mom y Kaido. Luffy es más que un pirata; es un símbolo de libertad y revolución para todo aquel que sueña con un mundo mejor.',
      },
      
      {
        'nombre': 'Zoro',
        'descripcion': 'Roronoa Zoro es el espadachín de los Piratas del Sombrero de Paja y uno de los personajes más icónicos de One Piece. Desde su infancia, Zoro ha tenido un sueño claro: convertirse en el mejor espadachín del mundo, superando a su rival y amigo, Dracule Mihawk. Su viaje comenzó cuando era un niño entrenando en un dojo, donde desarrolló una habilidad excepcional con la espada. Después de un trágico encuentro con su amiga Kuina, quien le prometió que él sería el mejor espadachín del mundo, Zoro se embarcó en su aventura para cumplir esa promesa. Zoro es conocido por su estilo de combate único, utilizando tres espadas al mismo tiempo, una técnica conocida como Santoryu. Su fuerza física y habilidades de combate son impresionantes, lo que le ha permitido enfrentarse a poderosos enemigos a lo largo de la serie. A pesar de su apariencia seria y a menudo intimidante, Zoro tiene un fuerte sentido del honor y la lealtad hacia sus nakamas. Es conocido por su sentido del deber y su determinación inquebrantable para proteger a sus amigos. Aunque a menudo se muestra desinteresado por las cosas triviales, Zoro tiene un gran corazón y siempre está dispuesto a arriesgar su vida por aquellos que ama. A lo largo de la serie, Zoro ha enfrentado numerosos desafíos y enemigos formidables, desde los Shichibukai hasta los Yonkō. Su viaje lo ha llevado a lugares increíbles y ha forjado alianzas con otros personajes importantes en el mundo de One Piece. Con su espada en mano y su espíritu indomable, Roronoa Zoro continúa luchando por su sueño y defendiendo a sus nakamas en cada paso del camino.',
      },

      {
        'nombre': 'Nami',
        'descripcion': 'Nami es la navegante de los Piratas del Sombrero de Paja y uno de los personajes más queridos de One Piece. Desde su infancia, Nami ha tenido un profundo amor por el mar y un sueño claro: crear un mapa completo del mundo. Su historia comienza en la isla de Cocoyashi, donde fue criada por su madre adoptiva, Bellemere, y su hermana Nojiko. Sin embargo, su vida cambió drásticamente cuando la isla fue tomada por el temido pirata Arlong y su tripulación. Nami se vio obligada a trabajar para ellos como cartógrafa, pero siempre soñando con la libertad y la posibilidad de explorar el mundo. A lo largo de su viaje con los Sombrero de Paja, Nami ha demostrado ser una navegante excepcional, capaz de leer el clima y predecir tormentas con una precisión asombrosa. Su habilidad para manipular el clima se ve potenciada por el uso del Clima-Tact, un arma que le permite crear fenómenos meteorológicos a su favor en combate. Aunque al principio era conocida por su astucia y habilidades para robar, Nami ha evolucionado como personaje y ha demostrado ser una valiosa aliada para sus nakamas. Su lealtad hacia Luffy y el resto de la tripulación es inquebrantable, y siempre está dispuesta a arriesgar su vida para protegerlos. A lo largo de la serie, Nami ha enfrentado numerosos desafíos y enemigos poderosos, desde los Shichibukai hasta los Yonkō. Su viaje la ha llevado a lugares increíbles y ha forjado alianzas con otros personajes importantes en el mundo de One Piece. Con su espíritu indomable y su amor por la aventura, Nami continúa navegando hacia nuevos horizontes junto a sus amigos en busca del tesoro más grande: la libertad.',
      },
      {
        'nombre': 'Sanji',
        'descripcion': 'Sanji es el cocinero de los Piratas del Sombrero de Paja y uno de los personajes más carismáticos de One Piece. Desde joven, Sanji soñó con encontrar el legendario All Blue, un mar donde se reúnen todos los peces del mundo, lo que le permitiría crear platos excepcionales. Su historia comienza en el Baratie, un restaurante flotante donde trabajaba como chef. Allí, conoció a su mentor, el famoso cocinero Zeff, quien le enseñó no solo a cocinar, sino también a luchar. Sanji es conocido por su estilo de combate único, utilizando principalmente sus piernas para atacar. Su técnica de pelea, conocida como Black Leg (Pierna Negra), combina habilidades de cocina y artes marciales, lo que lo convierte en un formidable luchador. A pesar de su apariencia despreocupada y su amor por las mujeres, Sanji es un guerrero leal y valiente que siempre está dispuesto a proteger a sus nakamas. Su personalidad es una mezcla de caballerosidad y pasión por la cocina, lo que lo convierte en un personaje entrañable. A lo largo de la serie, Sanji ha enfrentado numerosos desafíos y enemigos poderosos, desde los Shichibukai hasta los Yonkō. Su viaje lo ha llevado a lugares increíbles y ha forjado alianzas con otros personajes importantes en el mundo de One Piece. Con su amor por la cocina y su espíritu indomable, Sanji continúa navegando junto a sus amigos en busca del tesoro más grande: la libertad y el All Blue.',
      },
      {
        'nombre': 'Usopp',
        'descripcion': 'Usopp es el francotirador de los Piratas del Sombrero de Paja y uno de los personajes más entrañables de One Piece. Desde su infancia, Usopp ha sido un soñador y un contador de historias, lo que le ha llevado a crear su propio mundo lleno de aventuras. Su historia comienza en la isla de Syrup, donde vivía con su madre y soñaba con convertirse en un gran guerrero del mar. A pesar de su apariencia delgada y su personalidad algo cobarde, Usopp es un experto en el uso de la honda y tiene una gran habilidad para crear artilugios y armas únicas. Su técnica de combate, conocida como el "Sogeking", le permite utilizar su puntería excepcional para atacar a sus enemigos desde lejos. A lo largo de la serie, Usopp ha demostrado ser un valioso miembro de la tripulación, aportando no solo habilidades de combate, sino también ingenio y creatividad en situaciones difíciles. Su lealtad hacia Luffy y el resto de la tripulación es inquebrantable, y siempre está dispuesto a arriesgar su vida para protegerlos. A pesar de sus miedos y dudas, Usopp ha evolucionado como personaje y ha enfrentado numerosos desafíos y enemigos poderosos, desde los Shichibukai hasta los Yonkō. Su viaje lo ha llevado a lugares increíbles y ha forjado alianzas con otros personajes importantes en el mundo de One Piece. Con su espíritu indomable y su amor por las historias, Usopp continúa navegando junto a sus amigos en busca del tesoro más grande: la libertad y la aventura.',
      },
      // Agrega más personajes aquí
    ];

    return Scaffold(
      backgroundColor: const Color(0xff171717),
      appBar: AppBar(
        title: const Text('Historias'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Personajes',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            // Generamos un botón para cada personaje
            ...personajes.map((personaje) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15), // Espacio entre botones
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff252525),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    ),
                    onPressed: () {
                      _showCharacterDetails(context, personaje);
                    },
                    child: Text(personaje['nombre'] ?? 'Sin nombre'),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  void _showCharacterDetails(BuildContext context, Map personaje) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xff171717),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  personaje['nombre'] ?? 'Sin nombre', // Aseguramos que no sea null
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  personaje['descripcion'] ?? 'Sin descripción disponible.',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
