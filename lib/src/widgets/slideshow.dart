import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;

  final bool pointUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  const Slideshow({
    @required this.slides, 
    this.pointUp = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey, 
    this.primaryBullet = 12.0, 
    this.secondaryBullet = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
            child: Builder(
              builder: (BuildContext context) {

                Provider.of<_SlideshowModel>(context).primaryColor = this.primaryColor;
                Provider.of<_SlideshowModel>(context).secondaryColor = this.secondaryColor;
                Provider.of<_SlideshowModel>(context).primaryBullet = this.primaryBullet;
                Provider.of<_SlideshowModel>(context).secondaryBullet = this.secondaryBullet;

                return _BuildSlideshowStructure(pointUp: pointUp, slides: slides);
              }
            )
        ),
      ),
    );
  }
}

class _BuildSlideshowStructure extends StatelessWidget {
  const _BuildSlideshowStructure({
    Key key,
    @required this.pointUp,
    @required this.slides,
  }) : super(key: key);

  final bool pointUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[

    if(this.pointUp) _Dots(
      totalSlides: this.slides.length
    ),

    Expanded(child: _Slides(this.slides)),

    if(!this.pointUp) _Dots(
      totalSlides: this.slides.length
    ),
    
          ],
        );
  }
}

//DOTS================================================================================
class _Dots extends StatelessWidget {

  final int totalSlides;

  const _Dots({
    @required this.totalSlides,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            List.generate(this.totalSlides, (index) => 
              _Dot(
                index: index
              )
            ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(
    {
      this.index,
    });

  @override
  Widget build(BuildContext context) {
    // final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;
    final ssModel = Provider.of<_SlideshowModel>(context);

    double bulletSize = 0.0;
    Color color;

    if(ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5){
      bulletSize = ssModel.primaryBullet;
      color = ssModel.primaryColor;
    } else {
      bulletSize = ssModel.secondaryBullet;
      color = ssModel.secondaryColor;
    }


    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: bulletSize,
      height: bulletSize,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle),
    );
  }
}
//DOTS================================================================================

//_Slides================================================================================
class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: this.slide,
    );
  }
}
//_Slides================================================================================


class _SlideshowModel with ChangeNotifier {

  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12.0;
  double _secondaryBullet = 12.0;

  double get currentPage => this._currentPage;

  set currentPage( double currentPage ){
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor( Color color ){
    this._primaryColor = color;
  }
  
  Color get secondaryColor => this._secondaryColor;

  set secondaryColor( Color color ){
    this._secondaryColor = color;
  }

  double get primaryBullet => this._primaryBullet;

  set primaryBullet( double bullet ){
    this._primaryBullet = bullet;
  }

  double get secondaryBullet => this._secondaryBullet;

  set secondaryBullet( double bullet ){
    this._secondaryBullet = bullet;
  }

  
}