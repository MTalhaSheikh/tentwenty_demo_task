import 'package:flutter/material.dart';
import '../common/constants.dart';
import '../screens/watch_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    ImageIcon(
      AssetImage(
        "assets/images/dashboard.png",
      ),
      size: 40,
    ),
    WatchScreen(),
    ImageIcon(
      AssetImage("assets/images/media.png"),
      size: 40,
    ),
    ImageIcon(
      AssetImage("assets/images/more.png"),
      size: 40,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.lightThemeColor,
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Constants.darkThemeColor,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            // bottomRight: Radius.circular(30.0),
            // bottomLeft: Radius.circular(30.0),
          ),
          child: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Constants.darkThemeColor,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 0,
              iconSize: 20,
              mouseCursor: SystemMouseCursors.grab,
              selectedIconTheme:
              const IconThemeData(color: Colors.white, size: 20),
              selectedItemColor: Colors.white,
              selectedLabelStyle: const TextStyle(fontSize: 10),
              unselectedLabelStyle: const TextStyle(fontSize: 10),
              unselectedIconTheme: const IconThemeData(
                color: Colors.white30,
              ),
              unselectedItemColor: Colors.white30,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: ImageIcon(
                      AssetImage(
                        "assets/images/dashboard.png",
                      ),
                    ),
                  ),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: ImageIcon(
                      AssetImage("assets/images/Vector.png"),
                    ),
                  ),
                  label: 'Watch',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: ImageIcon(
                      AssetImage("assets/images/media.png"),
                    ),
                  ),
                  label: 'Media Library',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: ImageIcon(
                      AssetImage("assets/images/more.png"),
                    ),
                  ),
                  label: 'More',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
