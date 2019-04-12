import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_movies/src/blocs/movie_detail_bloc.dart';
import 'package:my_movies/src/blocs/movie_detail_bloc_provider.dart';
import 'package:my_movies/src/models/banner_model.dart';
import 'package:my_movies/src/models/trailer_model.dart';
import 'package:my_movies/src/ui/widgets/banner_carousel_view.dart';
import 'package:my_movies/src/ui/widgets/pack_gift_cell.dart';
import 'package:my_movies/src/ui/widgets/user_select_cell.dart';


class MovieDetail extends StatefulWidget {
  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  MovieDetail({
    this.title,
    this.posterUrl,
    this.description,
    this.releaseDate,
    this.voteAverage,
    this.movieId,
  });

  @override
  State<StatefulWidget> createState() {
    return MovieDetailState(
      title: title,
      posterUrl: posterUrl,
      description: description,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      movieId: movieId,
    );
  }
}

class MovieDetailState extends State<MovieDetail> {
  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  List<BannerModel> bannerList;

  List<BannerModel> buildList(BannerModel snapshot) {
    bannerList = new List ();
    for (var i = 0; i < 6; i++) {
      bannerList.add(new BannerModel(
        title: snapshot.title,
        subTitle: 'in Now E - HBO Go Pack now',
        buttonTitle: 'Purchase',
        posterUrl: snapshot.posterUrl,
        isButtonDisplay: false,
      ));
    }
    return bannerList;
  }

  MovieDetailBloc bloc;

  MovieDetailState({
    this.title,
    this.posterUrl,
    this.description,
    this.releaseDate,
    this.voteAverage,
    this.movieId,
    this.bannerList,
  });

  @override
  void didChangeDependencies() {
    bloc = MovieDetailBlocProvider.of(context);
    bloc.fetchTrailersById(movieId);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: StreamBuilder(
            stream: bloc.movieTrailers,
            builder: (context,
                AsyncSnapshot<Future<TrailerModel>> snapshot) {
              if (snapshot.hasData) {
                return FutureBuilder(
                  future: snapshot.data,
                  builder: (context,
                      AsyncSnapshot<TrailerModel> itemSnapShot) {
                    if (itemSnapShot.hasData) {
                      if (itemSnapShot.data.results.length > 0)
                        return Stack(
                          children: <Widget>[
                            NestedScrollView(
                                headerSliverBuilder:
                                    (BuildContext context,
                                    bool innerBoxIsScrolled) {
                                  return <Widget>[
                                    SliverAppBar(
                                      expandedHeight: 200.0,
                                      floating: false,
                                      pinned: true,
                                      elevation: 0.0,
                                      flexibleSpace: FlexibleSpaceBar(
                                          background: new BannerCarouselView (
                                            bannerList: buildList(new BannerModel(
                                              title: '',
                                              posterUrl: posterUrl,
                                              isButtonDisplay: false,
                                            )),
                                          )
                                      ),
                                      title: Text(title),
                                    ),
                                  ];
                                },
                                body: ListView(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[
                                          Container(
                                              margin: EdgeInsets.only(top: 5.0)),
                                          Text(
                                            'Pack Detail',
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Container(margin: EdgeInsets.only(
                                              top: 8.0, bottom: 8.0)),
                                          Text(description),
                                          Container(margin: EdgeInsets.only(
                                              top: 8.0, bottom: 8.0)),
                                          Text(
                                            "Gift Packs",
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Container(margin: EdgeInsets.only(
                                              top: 8.0, bottom: 8.0)),
                                          giftLayout(itemSnapShot.data),
                                          Text(
                                            'Game Information',
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Container(margin: EdgeInsets.only(
                                              top: 8.0, bottom: 8.0)),
                                          Text(description),
                                          Container(margin: EdgeInsets.only(
                                              top: 8.0, bottom: 8.0)),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            Positioned(
                                bottom: 0,
                                height: 60,
                                right: 0,
                                left: 0,
                                child: Container(
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                    ),]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:0.0, right: 20.0, left: 20.0),
                                    child: new Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(Icons.people),
                                        ),
                                        Expanded(
                                            child: GestureDetector(
                                              child: Text('Jennie'),
                                              onTap: () {
                                                  _settingModalBottomSheet(context);
                                              },
                                            )
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.greenAccent),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: FlatButton(
                                              onPressed: null,
                                              color: Colors.white,
                                              child: Text(
                                                'CP 140',
                                                style: TextStyle(
                                                  color: Colors.greenAccent,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.greenAccent,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: FlatButton(
                                                onPressed: null,
                                                color: Colors.white,
                                                child: Text(
                                                  'Pay 60',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                          ],
                        );
//                        return trailerLayout(itemSnapShot.data);
                      else
                        return noTrailer(itemSnapShot.data);
                    } else {
                      return Center(
                          child: CircularProgressIndicator());
                    }
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
        ),
      ),
    );
  }

  Widget noTrailer(TrailerModel data) {
    return Center(
      child: Container(
        child: Text("No trailer available"),
      ),
    );
  }

  Widget giftLayout(TrailerModel data) {
    if (data.results.length > 1) {
      return Column(
        children: <Widget>[
          PackGiftCell(data: data, index:0),
          PackGiftCell(data: data, index:1),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          PackGiftCell(data: data, index:0),
        ],
      );
    }
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: Colors.transparent,
            height: 150,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: const Radius.circular(10), topRight:const Radius.circular(10)),
              ),
              child: new Row( //should be listView.builder and from bloc later
                children: <Widget>[
                  UserSelectCell(
                    userName: 'Jennie',
                    userSim: '43211234',
                    profileImgUrl: 'https://cdn5.vectorstock.com/i/1000x1000/72/59/female-avatar-profile-icon-round-african-american-vector-18307259.jpg',
                  ),
                  UserSelectCell(
                    userName: 'Mark',
                    userSim: 'Activating',
                    profileImgUrl: 'https://cdn3.iconfinder.com/data/icons/avatars-9/145/Avatar_Robot-512.png',
                  ),
                  UserSelectCell(
                    userName: 'PS4',
                    userSim: '78901234',
                    profileImgUrl: 'https://lh3.googleusercontent.com/-zjMhpCYHEnA/VaTuR-aho-I/AAAAAAAAAB0/rnpCvXZG2Ro/w742-h742/asdasdasd.png',
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
