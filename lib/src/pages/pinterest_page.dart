import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        // body: PinterestGrid(),
        // body: PinterestMenu(),
        body: Stack(
          children: <Widget>[_PinterestGrid(), _PinterestMenuLocation()],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final bool showMenu = Provider.of<_MenuModel>(context).show;

    return Positioned(
      child: Container(
        width: widthScreen,
        child: Align(
          child: PinterestMenu(
            showMenu: showMenu,
            activeColor: Colors.blue,
            inactiveColor: Colors.blueGrey,
            backgroundColor: Colors.white,
            items: [
              PinterestButton(
                  icon: Icons.pie_chart,
                  onPressed: () {
                    print('icon_pie_chart');
                  }),
              PinterestButton(
                  icon: Icons.search,
                  onPressed: () {
                    print('icon_search');
                  }),
              PinterestButton(
                  icon: Icons.notifications,
                  onPressed: () {
                    print('icon_notifications');
                  }),
              PinterestButton(
                  icon: Icons.supervised_user_circle,
                  onPressed: () {
                    print('icon_supervised_user_circle');
                  }),
              
            ],
          ),
        ),
      ),
      bottom: 40,
    );
  }
}

class _PinterestGrid extends StatefulWidget {
  @override
  __PinterestGridState createState() => __PinterestGridState();
}

class __PinterestGridState extends State<_PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController scrollController = new ScrollController();
  double scrollBefore = 0.0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > scrollBefore) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

      scrollBefore =
          (scrollController.offset < 0) ? 0 : scrollController.offset;

      // print('ScrollController ${scrollController.offset}');
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PintrestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PintrestItem extends StatelessWidget {
  final int index;

  const _PintrestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

// Provider Pattern
class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;
  set show(bool value) {
    this._show = value;
    notifyListeners();
  }
}
