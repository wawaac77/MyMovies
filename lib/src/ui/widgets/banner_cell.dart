import 'package:flutter/material.dart';
import 'package:my_movies/src/blocs/movie_detail_bloc_provider.dart';
import 'package:my_movies/src/models/banner_model.dart';
import 'package:my_movies/src/models/item_model.dart';
import 'package:my_movies/src/ui/pages/movie_detail_stream.dart';

class BannerCell extends StatefulWidget {

  final BannerModel banner;
  final Result item;

  BannerCell ({
    this.banner,
    this.item,
  });

  @override
  _BannerCellState createState() => _BannerCellState(
    banner: banner,
    item: item,
  );
}

class _BannerCellState extends State<BannerCell> {

  final BannerModel banner;
  final Result item;

  _BannerCellState ({
    this.banner,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
//            image:new NetworkImage('${banner.posterUrl}'),
            image:new NetworkImage('https://image.tmdb.org/t/p/w500${banner.posterUrl}'),
            fit: BoxFit.cover,
          )
      ),
      child: new Column(
        children: <Widget>[
          new Expanded(child: new Container(

          )),
          new Text(
            banner.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          new Text(
            banner.subTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          banner.isButtonDisplay ? Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: new RaisedButton(
              onPressed: () => openDetailPage(context, item),
              child: Text(banner.buttonTitle),
            ),
          )
              : new Container(height: 30,),
        ],
      ),
    );
  }

  openDetailPage(BuildContext context, Result data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetailBlocProvider(
          child: MovieDetail(
            title: data.title,
            posterUrl: data.backdrop_path,
            description: data.overview,
            releaseDate: data.release_date,
            voteAverage: data.vote_average.toString(),
            movieId: data.id,
          ),
        );
      }),
    );
  }
}
