import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function onPress;

  FatButton(
      {@required this.icon,
      @required this.text,
      this.color1 = Colors.blue,
      this.color2 = Colors.blueGrey,
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: this.onPress,
        child: Stack(
          children: <Widget>[
            _FatButtonBackground(this.icon, this.color1, this.color2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 140,
                  width: 40,
                ),
                FaIcon(
                  this.icon,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    this.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                ),
                SizedBox(width: 40)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FatButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  _FatButtonBackground(this.icon, this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 10),
          ],
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: <Color>[this.color1, this.color2])),
    );
  }
}
