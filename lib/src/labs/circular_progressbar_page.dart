import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  CircularProgressPage({Key key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin{

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  // para la animación
  AnimationController controller;

  @override
  void initState() { 

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {
      // print('Valor controller ${controller.value}');
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value);
      });
    });

    super.initState();    
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          setState(() {

            porcentaje = nuevoPorcentaje;
            nuevoPorcentaje += 10;

            if (nuevoPorcentaje > 100) {
              nuevoPorcentaje = 0.0;
              porcentaje = 0.0;
            }
          });

          controller.forward(from: 0.0);
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    // CIRCULO COMPLETO
    // primero creamos el lapiz
    final paint = new Paint()
      ..strokeWidth = 5 // se define el ancho del lapiz
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    // definir como se debe dibujar el circulo
    // OffSet: La posición, EL radio y el lapiz definido
    final center =
        new Offset(size.width * 0.5, size.height / 2); // centro del circulo
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //ARCO
    final paintArco = new Paint()
      ..strokeWidth = 10 // se define el ancho del lapiz
      ..color = Colors.pinkAccent
      ..style = PaintingStyle.stroke;

    // la parte que se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);

    // Definimos el arco
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
