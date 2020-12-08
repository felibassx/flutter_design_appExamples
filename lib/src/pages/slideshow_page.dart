import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Center(
        child: Slideshow(
          pointUp: false,
          primaryBullet: 15,
          primaryColor: (appTheme.darkTheme)
              ? appTheme.currentTheme.accentColor
              : Color(0xffff5a7e),
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
