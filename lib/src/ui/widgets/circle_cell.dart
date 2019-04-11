import 'package:flutter/material.dart';
import 'package:my_movies/src/models/item_model.dart';

class CircleCell extends StatelessWidget {
  Result item;

  CircleCell ({
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 150,
        child: Column(
          children: <Widget>[
            new Container(
              width: 150,
              height: 150,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w185${item.poster_path}',
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Text(
              item.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '2018 world tour',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
