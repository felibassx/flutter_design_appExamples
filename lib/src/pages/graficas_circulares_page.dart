import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) {
                porcentaje = 0.0;
              }
            });
          }),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.red,
                ),
                CustomRadialProgress(
                  porcentaje: porcentaje * 1.2,
                  color: Colors.blue,
                ),
                CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.yellow,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(
                  porcentaje: porcentaje * 1.3,
                  color: Colors.cyanAccent,
                ),
                CustomRadialProgress(
                  porcentaje: porcentaje * 1.4,
                  color: Colors.orangeAccent,
                ),
                CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.redAccent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key key,
    @required this.porcentaje,
    @required this.color,
  }) : super(key: key);

  final double porcentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 120,
      height: 120,
      child: RadialProgress(
        percentage: porcentaje,
        colorPrimary: color,
        colorSecondary: appTheme.textTheme.bodyText1.color,
        secondaryThickness: 5.0,
        primaryThickness: 10,
        showPercentage: true,
      ),
    );
  }
}
