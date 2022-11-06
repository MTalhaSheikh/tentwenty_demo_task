import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/constants.dart';
import '../video_play_screen.dart';

class DetailscreenUperPart extends StatefulWidget {
  String imgPath;
  String releaseDateTxt;

  DetailscreenUperPart(this.imgPath, this.releaseDateTxt, {Key? key})
      : super(key: key);

  @override
  _DetailscreenUperPartState createState() => _DetailscreenUperPartState();
}

class _DetailscreenUperPartState extends State<DetailscreenUperPart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var isScreenPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Stack(
      children: [
        SizedBox(
          height: isScreenPortrait ? size.height * 0.5 : size.height,
          width: isScreenPortrait ? size.width : size.width * 0.5,
          child: CachedNetworkImage(
            imageUrl:
                "https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.imgPath}",
            imageBuilder: (context, imageProvider) => Container(
              height: size.height * 0.5,
              decoration: BoxDecoration(
                // borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: Constants.darkThemeColor,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Padding(
          padding: isScreenPortrait
              ? const EdgeInsets.only(
                  top: 66.0,
                  left: 25,
                )
              : const EdgeInsets.only(
                  top: 25.0,
                  left: 66,
                ),
          child: Column(
            children: [
              Row(
                children:[
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  const Text(
                    "Watch",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Colors.white),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170, bottom: 15),
                child: Text("In Theaters ${widget.releaseDateTxt}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff61C3F2),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                  child: Text(
                    "Get Tickets",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoPlayerScreen()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(color: Colors.cyan)
                        )
                    )
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 54.0, vertical: 15.0),
                  child: Text(
                    "Watch Trailer",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
