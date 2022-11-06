import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common/constants.dart';


Widget mainCardWidget(imgPath, title) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
    child: Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2$imgPath",
            imageBuilder: (context, imageProvider) => Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "$title",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget mediumCardWidget(imagePath, title){
  return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(15)),
      // child: Text(snapshot.data?.results![index].posterPath),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
            "https://image.tmdb.org/t/p/w600_and_h900_bestv2$imagePath",
            imageBuilder: (context, imageProvider) =>
                Container(
                  // height: 180,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: Constants.darkThemeColor,
              ),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 20),
              child: SizedBox(
                width: 140,
                child: Text(
                  "$title",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Colors.white,),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ));
}

Widget smallCardWidget(imagePath, title, releaseDate){
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
    child: SizedBox(
      height: 105,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl:
            "https://image.tmdb.org/t/p/w600_and_h900_bestv2$imagePath",
            imageBuilder: (context, imageProvider) =>
                Container(
                  height: 100,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: Constants.darkThemeColor,
              ),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21.0, top: 30),
            child: SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Constants.darkThemeColor,),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "$releaseDate",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Color(0xffDBDBDF),),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const Icon(Icons.more_horiz, color: Color(0xff61C3F2),)
        ],
      ),
    ),
  );
}