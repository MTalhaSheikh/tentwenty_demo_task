import 'package:flutter/material.dart';
import '../../widgets/genres_tab_widget.dart';

class DetailScreenLowerPart extends StatefulWidget {
  String overviewStr;
  String title;

  DetailScreenLowerPart(this.overviewStr, this.title, {Key? key}) : super(key: key);

  @override
  _DetailScreenLowerPartState createState() => _DetailScreenLowerPartState();
}

class _DetailScreenLowerPartState extends State<DetailScreenLowerPart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var isScreenPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: isScreenPortrait
          ? const EdgeInsets.symmetric(horizontal: 40.0, vertical: 27.0)
          : const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                color: Color(0xff202C43)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              children: [
                tabWidget("Action", const Color(0xff15D2BC)),
                tabWidget("Thriller", const Color(0xffE26CA5)),
                tabWidget("Science", const Color(0xff564CA3)),
                tabWidget("Fiction", const Color(0xffCD9D0F)),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Overview",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                color: Color(0xff202C43)),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            width: isScreenPortrait ? size.width : size.width * 0.4,
            child: Text(
              widget.overviewStr,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  color: Color(0xff8F8F8F),
                  height: 1.5,
                  // the height between text, default is null
                  letterSpacing: 0.3),
            ),
          )
        ],
      ),
    );
  }
}
