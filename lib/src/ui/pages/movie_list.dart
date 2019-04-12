import 'package:flutter/material.dart';
import 'package:my_movies/src/blocs/movie_detail_bloc_provider.dart';
import 'package:my_movies/src/blocs/movies_bloc.dart';
import 'package:my_movies/src/models/banner_model.dart';
import 'package:my_movies/src/models/item_model.dart';
import 'package:my_movies/src/ui/widgets/banner_carousel_view.dart';
import 'package:my_movies/src/ui/widgets/banner_cell.dart';
import 'package:my_movies/src/ui/widgets/circle_cell.dart';
import 'package:my_movies/src/ui/widgets/bars/home_app_bar.dart';
import 'package:my_movies/src/ui/widgets/pack_side_list.dart';
import 'package:my_movies/src/ui/widgets/text_header.dart';
import 'package:my_movies/src/ui/pages/movie_detail_stream.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';


class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  List<BannerModel> bannerList;

  int _currentBanner = 0;

  List<BannerModel> buildList(ItemModel snapshot) {
    bannerList = new List ();
    for (var i = 0; i < snapshot.results.length; i++) {
      bannerList.add(new BannerModel(
        title: snapshot.results[i].title,
        subTitle: 'in Now E - HBO Go Pack now',
        buttonTitle: 'Purchase',
        posterUrl: snapshot.results[i].poster_path,
        isButtonDisplay: true,
      ));
    }
    return bannerList;
  }

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
//    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: new StreamBuilder(
                stream: bloc.allMovies,
                builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                  if (snapshot.hasData) {
                    return NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context,
                            bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverAppBar(
                              expandedHeight: 400.0,
                              floating: false,
                              pinned: true,
                              elevation: 0.0,
                              flexibleSpace: FlexibleSpaceBar(
                                  background: Stack(
                                    children: <Widget>[
                                      CarouselSlider(
                                        height: 400.0,
                                        items: getBannerCellList(snapshot.data),
                                        autoPlay: true,
                                        autoPlayAnimationDuration: Duration(seconds: 2),
                                        onPageChanged: (index) {
                                          setState(() {
                                            _currentBanner = index;
                                          });
                                        },
                                      ),
                                      Positioned(
                                        child: Center(
                                          child: DotsIndicator(
                                              numberOfDot: snapshot.data.results.length,
                                              position: _currentBanner,
                                              dotColor: Colors.grey,
                                              dotActiveColor: Colors.greenAccent,
                                              dotSpacing: const EdgeInsets.all(2.5),
                                          ),
                                        ),
                                        bottom: 10,
                                        left: 10,
                                        right: 10,
                                      )
                                    ],
                                  ),

//                                  BannerCarouselView (
//                                    bannerList: buildList(snapshot.data),
//                                    itemList: snapshot.data,
//                                  )
                              ),
                              backgroundColor: Color.fromRGBO(20, 20, 20, 0.5),
                            ),
                          ];
                        },
                        body: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: new ListView(
                            children: <Widget>[
                              new TextHeader (
                                title: 'Hot Feature',
                                subTitle: 'Top 20 packs',
                              ),
                              new Container(
                                child: new ListView.builder(
                                  itemCount: snapshot.data.results.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      child: new Container(
                                        width: 200,
                                        height: 200,
                                        child: Image.network('https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}'),
                                      ),
                                      onTap: () => openDetailPage(snapshot.data, index),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                                height: 200,
                              ),
                              new TextHeader (
                                title: 'Live Teaster',
                                subTitle: '50+ Teaster',
                              ),
                              new Container(
                                child: new ListView.builder(
                                  itemCount: snapshot.data.results.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      child: CircleCell(
                                        item: snapshot.data.results[index],
                                      ),
                                      onTap: () => openDetailPage(snapshot.data, index),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                                height: 250,
                              ),
                              new Text(
                                'Trending Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Container(
                                  height: 300,
                                  child: Image.network('https://image.tmdb.org/t/p/w185${snapshot.data.results[2].poster_path}'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Container(
                                  height: 300,
                                  child: Image.network('https://image.tmdb.org/t/p/w185${snapshot.data.results[3].poster_path}'),
                                ),
                              ),
                              new TextHeader (
                                title: 'Tutorial',
                                subTitle: 'Support Center',
                              ),
                              new Container(
                                child: new ListView.builder(
                                  itemCount: snapshot.data.results.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      child: CircleCell(
                                        item: snapshot.data.results[index],
                                      ),
                                      onTap: () => openDetailPage(snapshot.data, index),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                                height: 280,
                              ),
                            ],
                          ),
                        ));
//                    return buildList(snapshot);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Center(child: CircularProgressIndicator());
                },
          ),
        ),
        new HomeAppBar(),

      ],
    );
  }

  openDetailPage(ItemModel data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetailBlocProvider(
          child: MovieDetail(
            title: data.results[index].title,
            posterUrl: data.results[index].backdrop_path,
            description: data.results[index].overview,
            releaseDate: data.results[index].release_date,
            voteAverage: data.results[index].vote_average.toString(),
            movieId: data.results[index].id,
          ),
        );
      }),
    );
  }

  List<Widget> getBannerCellList (ItemModel data) {
    List<BannerModel> bannerList = new List();
    List<Widget> list = new List<Widget>();

    for(var i = 0; i < data.results.length; i++){
      bannerList.add(new BannerModel(
        title: data.results[i].title,
        subTitle: 'in Now E - HBO Go Pack now',
        buttonTitle: 'Purchase',
        posterUrl: data.results[i].poster_path,
        isButtonDisplay: true,
      ));

      list.add(new BannerCell (
        banner: bannerList[i],
        item: data.results != null? data.results[i] : null,
      ));
    }
    return list;
  }
}
