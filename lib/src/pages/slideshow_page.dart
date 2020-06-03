import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Slideshow(
          slides: <Widget>[
            SvgPicture.asset('assets/images/svg/slide-1.svg'),
            SvgPicture.asset('assets/images/svg/slide-2.svg'),
            SvgPicture.asset('assets/images/svg/slide-3.svg'),
            SvgPicture.asset('assets/images/svg/slide-4.svg'),
            SvgPicture.asset('assets/images/svg/slide-5.svg'),
          ],
        ),
      ),
    );
  }
}

