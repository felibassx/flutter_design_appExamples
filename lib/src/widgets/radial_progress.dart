import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color colorPrimary;
  final Color colorSecondary;
  final double secondaryThickness;
  final double primaryThickness;
  final bool showPercentage;

  RadialProgress(
      {@required this.percentage,
      this.colorPrimary = Colors.blue,
      this.colorSecondary = Colors.grey,
      this.secondaryThickness = 5.0,
      this.primaryThickness = 10.0,
      this.showPercentage = false});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  double previusPercentage;

  @override
  void initState() {
    previusPercentage = widget.percentage;

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final difAnimate = widget.percentage - previusPercentage;

    previusPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgress(
                  (widget.percentage - difAnimate) +
                      (difAnimate * controller.value),
                  widget.colorPrimary,
                  widget.colorSecondary,
                  widget.secondaryThickness,
                  widget.primaryThickness),
              child: Center(
                  child: Text(
                (widget.showPercentage) ? '${widget.percentage} %' : '',
                style: TextStyle(
                    color: widget.colorPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )),
            ));
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimary;
  final Color colorSecundary;
  final double secondaryThickness;
  final double primaryThickness;

  _MiRadialProgress(this.porcentaje, this.colorPrimary, this.colorSecundary,
      this.secondaryThickness, this.primaryThickness);

  @override
  void paint(Canvas canvas, Size size) {
    // CIRCULO COMPLETO
    // primero creamos el lapiz
    final paint = new Paint()
      ..strokeWidth = secondaryThickness // se define el ancho del lapiz
      ..color = colorSecundary
      ..style = PaintingStyle.stroke;

    // definir como se debe dibujar el circulo
    // OffSet: La posición, EL radio y el lapiz definido
    final center =
        new Offset(size.width * 0.5, size.height / 2); // centro del circulo
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //ARCO
    final paintArco = new Paint()
      ..strokeWidth = primaryThickness // se define el ancho del lapiz
      ..color = colorPrimary
      // ..shader = gradient.createShadre(rect)
      ..strokeCap = StrokeCap.round
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
