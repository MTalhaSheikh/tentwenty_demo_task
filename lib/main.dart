import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_demo_task/screens/watch_screen.dart';
import 'package:tentwenty_demo_task/widgets/bottom_nav_bar.dart';
import 'common/constants.dart';
import 'data/providers/search_Provider/serach_service.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchServiceModel(),
        ),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const BottomNavBar(),
      routes: {
        Constants.watchScreen: (context) => const WatchScreen(),
      },
    );
  }
}

