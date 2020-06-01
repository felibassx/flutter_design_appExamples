import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0.0;
            }
          });
        }
      ),
      body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildCustomRadial(Colors.indigo),
                buildCustomRadial(Colors.red),
                buildCustomRadial(Colors.yellow),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildCustomRadial(Colors.black),
                buildCustomRadial(Colors.blue),
                buildCustomRadial(Colors.cyan),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildCustomRadial(Color colorPrimary) {
    return Container(
        width: 120,
        height: 120,
        child: RadialProgress( 
          percentage: porcentaje,
          colorPrimary: colorPrimary,
          colorSecondary: Colors.blueGrey,
          secondaryThickness: 5.0,
          primaryThickness: 10,
          showPercentage: true,
        ),
      );
  }
}