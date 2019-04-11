import 'package:flutter/material.dart';
import 'package:my_movies/src/ui/pages/movie_list.dart';
import 'package:my_movies/src/ui/pages/packs_list.dart';
import 'package:my_movies/src/ui/pages/setting_page.dart';

class MainTabBar extends StatefulWidget {
  MainTabBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainTabBar createState() => _MainTabBar();
}

class _MainTabBar extends State<MainTabBar> {
  int _currentIndex = 0;
  Map<int, Widget> children = <int, Widget> {
    0: MovieList(),
    1: PacksList(),
    2: MovieList(),
    3: MovieList(),
    4: SettingPage(),
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.transparent,
//        appBar: AppBar(
//          title: Text('Club SIM'),
//          backgroundColor: Colors.transparent,
//        ),
        bottomNavigationBar:new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: new BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              _currentIndex = index;
              setState(() {
              });
            },
            items: [
              new BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: Text(''),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.category),
                title: Text(''),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.card_giftcard),
                title: Text(''),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.brush),
                title: Text(''),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.shop),
                title: Text(''),
              ),
            ],
          ),
        ),
        body: children[_currentIndex]
    );
  }
}