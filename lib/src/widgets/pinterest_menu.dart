import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool showMenu;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu({
    this.showMenu = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    @required this.items
  });

  @override
  Widget build(BuildContext context) {
    // _MenuItems(items)
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
          duration: Duration(milliseconds: 250),
          curve: Curves.bounceOut,
          opacity: (showMenu) ? 1 : 0,
          child: Builder(builder: (BuildContext context) {

            Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

            return _PintrestMenuBackground(
              child: _MenuItems(items),
            );
          })),
    );
  }
}

class _PintrestMenuBackground extends StatelessWidget {
  final Widget child;

  _PintrestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatefulWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  __PinterestMenuButtonState createState() => __PinterestMenuButtonState();
}

class __PinterestMenuButtonState extends State<_PinterestMenuButton> {
  @override
  Widget build(BuildContext context) {
    final itemSelected = Provider.of<_MenuModel>(context).itemSelected;
    Color colorSelected = Provider.of<_MenuModel>(context).activeColor;
    double sizeSelected = 30;

    // Button selected set
    if (itemSelected == widget.index) {
      colorSelected = Provider.of<_MenuModel>(context).activeColor;
      sizeSelected = 35;
    } else {
      colorSelected = Provider.of<_MenuModel>(context).inactiveColor;
      sizeSelected = 25;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelected =
            widget.index;
        widget.item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          widget.item.icon,
          size: sizeSelected,
          color: colorSelected,
        ),
      ),
    );
  }
}

// Provider Pattern
class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get itemSelected => this._itemSelected;

  set itemSelected(int index) {
    this._itemSelected = index;
    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;
  set backgroundColor(Color value) {
    this._backgroundColor = value;
    notifyListeners();
  }

  Color get activeColor => this._activeColor;
  set activeColor(Color value) {
    this._activeColor = value;
    notifyListeners();
  }

  Color get inactiveColor => this._inactiveColor;
  set inactiveColor(Color value) {
    this._inactiveColor = value;
    notifyListeners();
  }
}
