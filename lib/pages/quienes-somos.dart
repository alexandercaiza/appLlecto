import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quienes somos'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan[300]!, Colors.blue[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSection(
                    title: 'Misión',
                    imagePath: 'assets/logo1.png',
                    paragraphs: [
                      'Nuestra misión es ofrecer productos y servicios de la más alta calidad, '
                          'generando valor para nuestros clientes y contribuyendo al desarrollo '
                          'sostenible de la comunidad.',
                      'Nos comprometemos a mejorar continuamente, adaptándonos a las necesidades '
                          'del mercado y fomentando la innovación en todos nuestros procesos.',
                      'Valoramos el trabajo en equipo y la colaboración, lo que nos permite crear '
                          'soluciones efectivas y fortalecer nuestras relaciones con los clientes.',
                      'Buscamos ser un referente en responsabilidad social, apoyando causas que '
                          'mejoren la calidad de vida de nuestra comunidad.',
                    ],
                  ),
                  SizedBox(height: 30),
                  _buildSection(
                    title: 'Visión',
                    imagePath: 'assets/logo1.png',
                    paragraphs: [
                      'Nuestra visión es ser la empresa líder en nuestro sector, reconocida por '
                          'nuestros estándares de excelencia y compromiso con la innovación y el '
                          'desarrollo humano.',
                      'Aspiramos a expandir nuestras operaciones a nivel internacional, llevando '
                          'nuestros productos y servicios a nuevos mercados.',
                      'Nos enfocamos en el crecimiento sostenible, implementando prácticas que '
                          'minimicen nuestro impacto ambiental y promuevan el bienestar de las '
                          'generaciones futuras.',
                      'Queremos ser reconocidos como un socio estratégico en la transformación '
                          'digital de nuestros clientes, facilitando su adaptación a un entorno '
                          'en constante cambio.',
                    ],
                  ),
                  SizedBox(height: 30),
                  _buildSection(
                    title: '¿Quiénes Somos?',
                    imagePath: 'assets/logo1.png',
                    paragraphs: [
                      'Somos un equipo apasionado y comprometido, dedicados a brindar soluciones '
                          'efectivas a nuestros clientes, promoviendo un ambiente de trabajo '
                          'colaborativo y enriquecedor.',
                      'Contamos con un grupo diverso de profesionales con experiencia en diversas '
                          'áreas, lo que nos permite abordar los desafíos desde múltiples perspectivas.',
                      'Fomentamos el desarrollo personal y profesional de nuestro equipo, '
                          'proporcionando oportunidades de capacitación y crecimiento.',
                      'Nuestro enfoque se basa en la ética, la transparencia y el respeto, '
                          'valores fundamentales que guían todas nuestras interacciones.',
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
      {required String title,
      required String imagePath,
      required List<String> paragraphs}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Image.asset(
          imagePath,
          height: 100, // Ajusta la altura según sea necesario
        ),
        SizedBox(height: 10),
        ...paragraphs
            .map((paragraph) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    paragraph,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ))
            .toList(),
      ],
    );
  }
}
