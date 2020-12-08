import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff6638f0),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff6638f0),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50))),
    );
  }
}

// Utilización del CutomPaint --------------------------------------

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        // utilización del CustomPaint
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Primero creamos una variable de tipo Paint
    // Qué es el Paint?, El Paint es el lapiz que utilizaremos para dibujar
    final lapiz = Paint();
    lapiz.color = Color(0xff6638f0);
    lapiz.style = PaintingStyle
        .fill; // .fill: estodo el relleno y .stroke: es solo los bordes
    lapiz.strokeWidth = 2; // strokeWidth es el ancho del lapiz

    final path = Path(); // es la parte como quiero mover el lapiz

    // Dibujar con el path y el lapiz
    // por rdefecto el path esta en la posicion 0,0
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.35);

    // le digo que dibuje en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

////////HeaderTrieangular//////////////////////////////////////////////////////////////////////////////////////////////

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        // utilización del CustomPaint
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Primero creamos una variable de tipo Paint
    // Qué es el Paint?, El Paint es el lapiz que utilizaremos para dibujar
    final lapiz = Paint();
    lapiz.color = Color(0xff6638f0);
    lapiz.style = PaintingStyle
        .fill; // .fill: estodo el relleno y .stroke: es solo los bordes
    lapiz.strokeWidth = 2; // strokeWidth es el ancho del lapiz

    final path = Path(); // es la parte como quiero mover el lapiz

    // Dibujar con el path y el lapiz
    // por rdefecto el path esta en la posicion 0,0
    // path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.50);

    // le digo que dibuje en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

////////HeaderPico//////////////////////////////////////////////////////////////////////////////////////////////

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        // utilización del CustomPaint
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Primero creamos una variable de tipo Paint
    // Qué es el Paint?, El Paint es el lapiz que utilizaremos para dibujar
    final lapiz = Paint();
    lapiz.color = Color(0xff6638f0);
    lapiz.style = PaintingStyle
        .fill; // .fill: estodo el relleno y .stroke: es solo los bordes
    lapiz.strokeWidth = 20; // strokeWidth es el ancho del lapiz

    final path = Path(); // es la parte como quiero mover el lapiz

    // Dibujar con el path y el lapiz
    // por rdefecto el path esta en la posicion 0,0
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // le digo que dibuje en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

////////HeaderCurvo//////////////////////////////////////////////////////////////////////////////////////////////
class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        // utilización del CustomPaint
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Primero creamos una variable de tipo Paint
    // Qué es el Paint?, El Paint es el lapiz que utilizaremos para dibujar
    final lapiz = Paint();
    lapiz.color = Color(0xff6638f0);
    lapiz.style = PaintingStyle
        .fill; // .fill: estodo el relleno y .stroke: es solo los bordes
    lapiz.strokeWidth = 20; // strokeWidth es el ancho del lapiz

    final path = Path(); // es la parte como quiero mover el lapiz

    // Dibujar con el path y el lapiz
    // por rdefecto el path esta en la posicion 0,0
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Ejemplo0 curvatura hacia arriba
    // path.lineTo(0, size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.5, size.height * 0.10, size.width, size.height * 0.25);
    // path.lineTo(size.width, 0);

    // le digo que dibuje en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

////////HeaderWave//////////////////////////////////////////////////////////////////////////////////////////////
class HeaderWave extends StatelessWidget {
  const HeaderWave({Key key, @required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        // utilización del CustomPaint
        painter: _HeaderWavePainter(this.color),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  final Color color;

  _HeaderWavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    // Primero creamos una variable de tipo Paint
    // Qué es el Paint?, El Paint es el lapiz que utilizaremos para dibujar
    final lapiz = Paint();
    lapiz.color = this.color;
    lapiz.style = PaintingStyle
        .fill; // .fill: estodo el relleno y .stroke: es solo los bordes
    lapiz.strokeWidth = 20; // strokeWidth es el ancho del lapiz

    final path = Path(); // es la parte como quiero mover el lapiz

    // Dibujar con el path y el lapiz
    // por rdefecto el path esta en la posicion 0,0
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Ejemplo0 curvatura hacia arriba
    // path.lineTo(0, size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.5, size.height * 0.10, size.width, size.height * 0.25);
    // path.lineTo(size.width, 0);

    // le digo que dibuje en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

////////HeaderWaveGradient//////////////////////////////////////////////////////////////////////////////////////////////
class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        // utilización del CustomPaint
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // DONE: creamos el gradiente
    final Rect rect = Rect.fromCircle(center: Offset(165, 55), radius: 180);

    final Gradient gradiente = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.2,
          0.5,
          1.0
        ],
        colors: <Color>[
          Color(0xFF6D05E8),
          Color(0xFFC012FF),
          Color(0xFF6D05FA),
        ]);
    // creamos el gradiente

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    lapiz.style = PaintingStyle
        .fill; // .fill: estodo el relleno y .stroke: es solo los bordes
    lapiz.strokeWidth = 20; // strokeWidth es el ancho del lapiz

    final path = Path(); // es la parte como quiero mover el lapiz

    // Dibujar con el path y el lapiz
    // por rdefecto el path esta en la posicion 0,0
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Ejemplo0 curvatura hacia arriba
    // path.lineTo(0, size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.5, size.height * 0.10, size.width, size.height * 0.25);
    // path.lineTo(size.width, 0);

    // le digo que dibuje en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

////////Header ICON//////////////////////////////////////////////////////////////////////////////////////////////

class IconHeaderWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color color1;
  final Color color2;

  const IconHeaderWidget(
      {@required this.icon,
      @required this.title,
      @required this.subTitle,
      this.color1 = Colors.blue,
      this.color2 = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    final Color colorWhite = Colors.white.withOpacity(0.7);

    return Stack(
      children: <Widget>[
        _IconHeaderBackground(this.color1, this.color2),
        Positioned(
            top: -50,
            left: -70,
            child: FaIcon(
              this.icon,
              color: Colors.white.withOpacity(0.2),
              size: 250,
            )),
        Column(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              this.subTitle,
              style: TextStyle(fontSize: 20, color: colorWhite),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.title,
              style: TextStyle(
                  fontSize: 25, color: colorWhite, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(
              this.icon,
              color: Colors.white,
              size: 80,
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground(this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                this.color1,
                this.color2,
              ])),
    );
  }
}
