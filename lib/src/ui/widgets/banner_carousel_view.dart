import 'package:flutter/material.dart';
import 'package:my_movies/src/models/banner_model.dart';
import 'package:my_movies/src/models/item_model.dart';
import 'package:my_movies/src/ui/widgets/banner_cell.dart';

class BannerCarouselView extends StatefulWidget {

  final List<BannerModel> bannerList;
  final ItemModel itemList;

  BannerCarouselView ({
    this.bannerList,
    this.itemList,
  });

  @override
  _BannerCarouselViewState createState() => _BannerCarouselViewState(
    bannerList: bannerList,
    itemList: itemList,
  );
}

class _BannerCarouselViewState extends State<BannerCarouselView> {

  List<BannerModel> bannerList;
  ItemModel itemList;

  PageController pageController;
  int currentPage = 0;

  _BannerCarouselViewState ({
    this.bannerList,
    this.itemList,
  });

  @override
  void initState() {
    super.initState();
    pageController = new PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 1,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new PageView.builder(
      controller: pageController,
      itemCount: bannerList.length,
      onPageChanged: (value) {
        setState(() {
          currentPage = value;
        });
      },
      itemBuilder: (context, index) => new BannerCell (
        banner: bannerList[index],
        item: itemList != null? itemList.results[index] : null,
      ),
    );
  }
}
