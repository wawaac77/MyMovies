import 'package:flutter/material.dart';
import 'package:my_movies/src/ui/pages/movie_detail_stream.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: 0,
        height: 90,
        right: 0,
        left: 0,
        child: Container(
          height: 90,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(bottom:0.0, right: 20.0, left: 20.0),
            child: new Row(
              children: <Widget>[
                new GestureDetector(
                  child: new Image(
                    image: AssetImage('assets/scanner_icon.png'),
                    height: 25,
                    width: 25,
                    fit: BoxFit.fitHeight,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MovieDetail()),
                    );
                  },
                ),
                Expanded(
                  child: new Image(
                    image: AssetImage('assets/cs_logo.png'),
                    height: 25,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                new Image(
                  image: AssetImage('assets/tv_icon.png'),
                  height: 40,
                  width: 40,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
        )
    );
  }
}
