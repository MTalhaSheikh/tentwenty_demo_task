import 'package:flutter/material.dart';
import 'detail_screen_lowerpart.dart';
import 'detail_scren_uperpart.dart';

class DetailScreen extends StatefulWidget {
  String imgPath;
  String overView;
  String title;
  String releaseDateText;

  DetailScreen(this.imgPath, this.overView, this.title, this.releaseDateText, {Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var isScreenPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: isScreenPortrait ?  Column(
            children: [
              DetailscreenUperPart(widget.imgPath, widget.releaseDateText),
              DetailScreenLowerPart(widget.overView, widget.title),
            ],
          ): Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailscreenUperPart(widget.imgPath, widget.releaseDateText),
              DetailScreenLowerPart(widget.overView, widget.title),
            ],
          ),
        ),
      ),
    );
  }
}
