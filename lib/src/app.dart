import 'package:flutter/material.dart';
import 'package:my_movies/src/ui/widgets/bars/main_tab_bar.dart';
import 'package:my_movies/src/ui/pages/packs_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData.dark(),
      home:  MainTabBar(),
    );
  }
}
