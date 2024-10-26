import 'package:flutter/material.dart';
import 'pages/quienes-somos.dart';
import 'pages/contacto.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecto App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item('assets/logo1.png', 'Lectura rápida',
        'Lee más palabras en un minuto y recuerda lo que lees'),
    Item('assets/logo2.png', 'Memoriza fotográfica',
        'El entreamiento te permitira mejorar la retención de información y recordar todo'),
    Item('assets/logo3.png', 'Busqueda de patrones',
        'Análiza y busca patrones en la información para mejorar tu salario'),
    Item('assets/logo4.png', 'Mejora tu concentración',
        'Deja de distraerte con todo, la concentración te abrira puertas '),
    Item('assets/logo5.png', 'Incrementa tu productividad',
        'El trabajo inteligente es mejor que el trabajo duro, entrena con nosotros'),
    Item('assets/logo1.png', 'Incrementa tu IQ',
        'El IQ te permitira mejerar tu vida, con nuestro entrenamiento lo lograrás'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecto App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menú de Navegación',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Contacto'),
              onTap: () {
                Navigator.pop(context); // Cerrar el menú
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
              },
            ),
            ListTile(
              title: Text('Quienes somos'),
              onTap: () {
                Navigator.pop(context); // Cerrar el menú
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan[300]!, Colors.blue[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showDescriptionDialog(context, items[index].description);
              },
              child: Card(
                margin: EdgeInsets.all(8),
                color: Color(0xFFB8E0D2), // Color #b8e0d2
                elevation: 5, // Sombra en la tarjeta
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        items[index].imageUrl,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        items[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          _showDescriptionDialog(
                              context, items[index].description);
                        },
                        child: Text(
                          'Ver más',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showDescriptionDialog(BuildContext context, String description) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            width: 300, // Ancho del diálogo
            child: Material(
              type: MaterialType.transparency,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1.0, 0.0), // Comienza fuera de la pantalla
                  end: Offset(0.0, 0.0), // Termina en la posición original
                ).animate(CurvedAnimation(
                  parent: animation1,
                  curve: Curves.easeInOut,
                )),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Descripción',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(height: 10),
                      Text(description),
                      SizedBox(height: 20),
                      TextButton(
                        child: Text('Cerrar'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Cerrar el dialog
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Item {
  final String imageUrl;
  final String title;
  final String description;

  Item(this.imageUrl, this.title, this.description);
}
