import 'package:disenos_app/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Center(
            child: Column(
          children: <Widget>[Expanded(child: _Slides()), _Dots()],
        )),
      ),
    );
  }
}

//DOTS================================================================================
class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_Dot(index: 0), _Dot(index: 1), _Dot(index: 2)],
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
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      print('Página actual: ${pageViewController.page}');

      // Actiualizar el provider, SliderModel
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
        children: <Widget>[
          Slide(svg: 'assets/images/svg/slide-1.svg'),
          Slide(
            svg: 'assets/images/svg/slide-2.svg',
          ),
          Slide(
            svg: 'assets/images/svg/slide-3.svg',
          ),
        ],
      ),
    );
  }
}

class Slide extends StatelessWidget {
  final String svg;

  Slide({this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(
        svg,
      ),
    );
  }
}
//_Slides================================================================================
