
import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
import 'package:flutter/material.dart';
 
// import 'package:disenos_app/src/pages/cuadrado_animado_page.dart';
// import 'package:disenos_app/src/pages/headers_pages.dart';
// import 'package:disenos_app/src/pages/animations_page.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: GraficasCircularesPage()
    );
  }
}