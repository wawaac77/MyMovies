import 'package:flutter/material.dart';
import 'package:my_movies/src/models/trailer_model.dart';

class PackGiftCell extends StatelessWidget {

  TrailerModel data;
  int index;

  PackGiftCell ({
    this.data,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            width: 80.0,
            color: Colors.grey,
            child: Center(child: Icon(Icons.play_circle_filled)),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  data.results[index].name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Mandarin Jacket (Blue) (Permand) x 1',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
