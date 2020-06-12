import 'package:animate_do/animate_do.dart';
import 'package:disenos_app/src/widgets/fat_button.dart';
import 'package:flutter/material.dart';
import 'package:disenos_app/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  ItemBoton(this.icon, this.texto, this.color1, this.color2, this.onPress);
}

class EmergencyPage extends StatelessWidget {
  // Color(0xff6989f5),
  //           Color(0xff906ef5),

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(
          FontAwesomeIcons.carCrash,
          'Motor Accident',
          Color(0xff6989F5),
          Color(0xff906EF5),
          () => print('Click en Motor Accident')),
      new ItemBoton(
          FontAwesomeIcons.plus,
          'Medical Emergency',
          Color(0xff66A9F2),
          Color(0xff536CF6),
          () => print('Click en Medical Emergency')),
      new ItemBoton(
          FontAwesomeIcons.theaterMasks,
          'Theft / Harrasement',
          Color(0xffF2D572),
          Color(0xffE06AA3),
          () => print('Click en Theft / Harrasement')),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D), () => print('Click en Awards')),
      new ItemBoton(
          FontAwesomeIcons.carCrash,
          'Motor Accident',
          Color(0xff6989F5),
          Color(0xff906EF5),
          () => print('Click en Motor Accident')),
      new ItemBoton(
          FontAwesomeIcons.plus,
          'Medical Emergency',
          Color(0xff66A9F2),
          Color(0xff536CF6),
          () => print('Click en Medical Emergency')),
      new ItemBoton(
          FontAwesomeIcons.theaterMasks,
          'Theft / Harrasement',
          Color(0xffF2D572),
          Color(0xffE06AA3),
          () => print('Click en Theft / Harrasement')),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D), () => print('Click en Awards')),
      new ItemBoton(
          FontAwesomeIcons.carCrash,
          'Motor Accident',
          Color(0xff6989F5),
          Color(0xff906EF5),
          () => print('Click en Motor Accident')),
      new ItemBoton(
          FontAwesomeIcons.plus,
          'Medical Emergency',
          Color(0xff66A9F2),
          Color(0xff536CF6),
          () => print('Click en Medical Emergency')),
      new ItemBoton(
          FontAwesomeIcons.theaterMasks,
          'Theft / Harrasement',
          Color(0xffF2D572),
          Color(0xffE06AA3),
          () => print('Click en Theft / Harrasement')),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D), () => print('Click en Awards')),
    ];

    // generar una lista de Widget a partir de un listado de objetos
    List<Widget> itemsMap = items
        .map((item) => FadeInLeft(
              duration: Duration(milliseconds: 250),
              child: FatButton(
                icon: item.icon,
                text: item.texto,
                color1: item.color1,
                color2: item.color2,
                onPress: item.onPress,
              ),
            ))
        .toList();

    return Scaffold(
        body: Stack(
      children: <Widget>[_ListFatButtons(itemsMap: itemsMap), _Header()],
    ));
  }
}

class _ListFatButtons extends StatelessWidget {
  const _ListFatButtons({
    Key key,
    @required this.itemsMap,
  }) : super(key: key);

  final List<Widget> itemsMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          ...itemsMap,
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeaderWidget(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia Médica',
          subTitle: 'Haz solicitado',
          color1: Color(0xff536bf6),
          color2: Color(0xff67acf2),
        ),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
              onPressed: () => print('buttom superior'),
              shape: CircleBorder(),
              padding: EdgeInsets.all(15),
              child: FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
