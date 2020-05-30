import 'package:flutter/material.dart';

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
          bottomLeft: Radius.circular(50)
        )
      ),
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
      child: CustomPaint( // utilización del CustomPaint
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
    lapiz.style = PaintingStyle.fill; // .fill: estodo el relleno y .stroke: es solo los bordes
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
      child: CustomPaint( // utilización del CustomPaint
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
    lapiz.style = PaintingStyle.fill; // .fill: estodo el relleno y .stroke: es solo los bordes
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
      child: CustomPaint( // utilización del CustomPaint
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
    lapiz.style = PaintingStyle.fill; // .fill: estodo el relleno y .stroke: es solo los bordes
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
      child: CustomPaint( // utilización del CustomPaint
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
    lapiz.style = PaintingStyle.fill; // .fill: estodo el relleno y .stroke: es solo los bordes
    lapiz.strokeWidth = 20; // strokeWidth es el ancho del lapiz

    final path = Path(); // es la parte como quiero mover el lapiz

    // Dibujar con el path y el lapiz
    // por rdefecto el path esta en la posicion 0,0
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
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
  const HeaderWave({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint( // utilización del CustomPaint
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // Primero creamos una variable de tipo Paint
    // Qué es el Paint?, El Paint es el lapiz que utilizaremos para dibujar
    final lapiz = Paint();
    lapiz.color = Color(0xff6638f0);
    lapiz.style = PaintingStyle.fill; // .fill: estodo el relleno y .stroke: es solo los bordes
    lapiz.strokeWidth = 20; // strokeWidth es el ancho del lapiz

    final path = Path(); // es la parte como quiero mover el lapiz

    // Dibujar con el path y el lapiz
    // por rdefecto el path esta en la posicion 0,0
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
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
      child: CustomPaint( // utilización del CustomPaint
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {


    // DONE: creamos el gradiente
    final Rect rect = Rect.fromCircle(
      center: Offset(165, 55),
      radius: 180
    );

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
      ]
      
    );
     // creamos el gradiente
    
    final lapiz = Paint()..shader = gradiente.createShader(rect);
    
    lapiz.style = PaintingStyle.fill; // .fill: estodo el relleno y .stroke: es solo los bordes
    lapiz.strokeWidth = 20; // strokeWidth es el ancho del lapiz

    final path = Path(); // es la parte como quiero mover el lapiz

    // Dibujar con el path y el lapiz
    // por rdefecto el path esta en la posicion 0,0
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
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

