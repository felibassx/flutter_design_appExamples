import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:disenos_app/src/models/slider_model.dart';


class Slideshow extends StatelessWidget {

  final List<Widget> slides;

  const Slideshow({
    @required this.slides
  });



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Center(
          child: Column(
        children: <Widget>[
          Expanded(
            child: _Slides( this.slides )
          ), 
          _Dots( totalSlides: this.slides.length, ),
        ],
      )),
    );
  }
}

//DOTS================================================================================
class _Dots extends StatelessWidget {

  final int totalSlides;

  const _Dots({ @required this.totalSlides });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, 
          (index) => _Dot(index: index)
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({this.index});

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index +0.5) ? 
                    Colors.blue : Colors.grey, 
        shape: BoxShape.circle
      ),
    );
  }
}
//DOTS================================================================================


//_Slides================================================================================
class _Slides extends StatefulWidget {

  final List<Widget> slides;

  const _Slides(
    this.slides
  );

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page;
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

