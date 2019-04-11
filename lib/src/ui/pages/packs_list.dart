import 'package:flutter/material.dart';
import 'package:my_movies/src/blocs/packs_bloc.dart';
import 'package:my_movies/src/models/category_result_model.dart';
import 'package:my_movies/src/ui/widgets/pack_side_list.dart';

class PacksList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PacksListState();
  }
}

class PacksListState extends State<PacksList> {
  @override
  void initState() {
    super.initState();
    packsBloc.fetchAllPacks();
  }

  @override
  void dispose() {
//    packsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
        stream: packsBloc.allPacks,
        builder: (context, AsyncSnapshot<ResultModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
    );
  }

  Widget buildList(AsyncSnapshot<ResultModel> snapshot) {
    ScrollController scrollController = new ScrollController();

    return Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: snapshot.data.categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: new Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 15, right: 15),
                height: 100,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              snapshot.data.categoryList[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              snapshot.data.categoryList[index].name,
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.network(
                        snapshot.data.categoryList[index].img,
                        fit: BoxFit.fitHeight,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            );
          },
          scrollDirection: Axis.vertical,
        ),
        Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(20, 20, 20, 0.8),
              ),
              width: 200,
              child: PackIconListView(
                scrollController: scrollController,
                data: snapshot.data,
              ),
            )
        ),
      ],
    );
  }
}
