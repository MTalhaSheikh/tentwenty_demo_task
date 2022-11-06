import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_demo_task/data/models/upcoming_movies_api_model.dart';
import '../common/constants.dart';
import '../control/upcoming_api_controller.dart';
import '../data/providers/search_Provider/serach_service.dart';
import '../widgets/card_widgets.dart';
import '../widgets/search_widget.dart';
import 'detail/detail_screen.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  TextEditingController searchTextController = TextEditingController();
  bool isSearchOpt = false;
  Future<UpComingApiModel>? futureData;

  @override
  void initState() {
    futureData = ApiController().getApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Visibility(
            visible: isSearchOpt == false,
            child: Container(
              color: const Color(0xffFFFFFF),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 22.0),
                child: Row(
                  children: [
                    const Text(
                      "Watch",
                      style: TextStyle(
                          color: Constants.darkThemeColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isSearchOpt = true;
                          });
                        },
                        child: const Icon(Icons.search))
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: isSearchOpt != false,
            child: SearchWidget(
              searchTextController,
            ),
          ),
          Consumer<SearchServiceModel>(
              builder: (context, servicesService, child) {
            return FutureBuilder<UpComingApiModel>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (isSearchOpt) {
                      if (servicesService.showSmallCards == true) {
                        return servicesService.showOrgList
                            ? Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(
                                      bottom: kFloatingActionButtonMargin + 20),
                                  itemCount: snapshot.data!.results!.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => DetailScreen(
                                                    snapshot.data?.results![index].posterPath,
                                                    snapshot.data?.results![index].overview,
                                                    snapshot.data?.results![index].title,
                                                    snapshot.data?.results![index].releaseDate)));},
                                      child: smallCardWidget(
                                          snapshot
                                              .data?.results![index].posterPath,
                                          snapshot.data?.results![index].title,
                                          snapshot
                                              .data?.results![index].releaseDate),
                                    );
                                  },
                                ),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(
                                      bottom: kFloatingActionButtonMargin + 20),
                                  itemCount: snapshot.data!.results!.length,
                                  itemBuilder: (context, index) {
                                    return snapshot.data!.results![index].title
                                            .toString()
                                            .toLowerCase()
                                            .trim()
                                            .contains(searchTextController.text
                                                .toLowerCase()
                                                .trim())
                                        ? GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => DetailScreen(
                                                    snapshot.data?.results![index].posterPath,
                                                    snapshot.data?.results![index].overview,
                                                    snapshot.data?.results![index].title,
                                                    snapshot.data?.results![index].releaseDate)));},
                                          child: smallCardWidget(
                                              snapshot.data?.results![index]
                                                  .posterPath,
                                              snapshot
                                                  .data?.results![index].title,
                                              snapshot.data?.results![index]
                                                  .releaseDate),
                                        )
                                        : Container();
                                  },
                                ),
                              );
                      } else {
                        return Expanded(
                          child: GridView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30.0),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: snapshot.data!.results!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                snapshot.data?.results![index]
                                                    .posterPath,
                                                snapshot.data?.results![index]
                                                    .overview,
                                                snapshot.data?.results![index]
                                                    .title,
                                                snapshot.data?.results![index]
                                                    .releaseDate)));
                                  },
                                  child: mediumCardWidget(
                                      snapshot.data?.results![index].posterPath,
                                      snapshot.data?.results![index].title),
                                );
                              }),
                        );
                      }
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(
                              bottom: kFloatingActionButtonMargin + 20),
                          itemCount: snapshot.data!.results!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            snapshot.data?.results![index].posterPath,
                                            snapshot.data?.results![index].overview,
                                            snapshot.data?.results![index].title,
                                            snapshot.data?.results![index].releaseDate)));
                              },
                              child: mainCardWidget(
                                  snapshot.data?.results![index].posterPath,
                                  snapshot.data?.results![index].title),
                            );
                          },
                        ),
                      );
                    }
                  } else {
                    return const Expanded(
                      child: Center(
                        child: SpinKitThreeBounce(
                          color: Constants.darkThemeColor,
                        ),
                      ),
                    );
                  }
                });
          }),
        ],
      ),
    );
  }
}
