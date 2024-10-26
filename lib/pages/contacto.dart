import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  String? _usuario, _clave, _email, _celular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacto'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan[300]!, Colors.blue[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16.0), // Margen alrededor del contenido
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Página de Contacto',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Imagen del logo
            Image.asset(
              'assets/logo1.png', // Asegúrate de que la ruta sea correcta
              height: 100, // Ajusta la altura según sea necesario
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Aquí puedes agregar información de contacto o cualquier detalle relevante.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Para consultas y asistencia, no dudes en contactarnos a través de nuestro '
                'correo electrónico o número de celular. Nuestro equipo está disponible '
                'para ayudarte en lo que necesites.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Estamos comprometidos a responder a todas las consultas dentro de 24 horas. '
                'Apreciamos tu interés y estamos aquí para brindarte la mejor atención.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Nuestra oficina está abierta de lunes a viernes, de 9:00 a 17:00. '
                'Te invitamos a visitarnos o llamarnos durante estos horarios.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Para más información, haz clic en el botón +',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openForm(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _openForm(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: Alignment.center,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(-1.0, 0.0), // Comienza desde la izquierda
              end: Offset(0.0, 0.0), // Termina en el centro
            ).animate(CurvedAnimation(
              parent: animation1,
              curve: Curves.easeInOut,
            )),
            child: AlertDialog(
              title: Text('Formulario de Contacto'),
              content: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Usuario'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu usuario';
                          }
                          return null;
                        },
                        onSaved: (value) => _usuario = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Clave'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu clave';
                          }
                          return null;
                        },
                        onSaved: (value) => _clave = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Por favor ingresa un email válido';
                          }
                          return null;
                        },
                        onSaved: (value) => _email = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Celular'),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu número de celular';
                          }
                          return null;
                        },
                        onSaved: (value) => _celular = value,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Aquí puedes manejar el envío de datos
                            print(
                                'Usuario: $_usuario, Clave: $_clave, Email: $_email, Celular: $_celular');
                            Navigator.of(context).pop(); // Cerrar el diálogo
                          }
                        },
                        child: Text('Enviar'),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cerrar el diálogo
                  },
                  child: Text('Cerrar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
