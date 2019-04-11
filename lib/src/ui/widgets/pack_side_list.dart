import 'package:flutter/material.dart';
import 'package:my_movies/src/models/category_result_model.dart';

class PackIconListView extends StatefulWidget {
  final ScrollController scrollController;
  final ResultModel data;
  Function() updateIconList;
  PackIconListView ({
    this.data,
    this.scrollController,
    this.updateIconList,
  });

  @override
  _PackIconListViewState createState() => _PackIconListViewState();
}

class _PackIconListViewState extends State<PackIconListView> {

  @override
  Widget build(BuildContext context) {
    return new ListView.builder (
      itemBuilder: (context, index) => new _PackIcon(
        controller: widget.scrollController,
        index: index.toDouble(),
        avatarImagePath: widget.data.categoryList[index].avatar,
        packItem: widget.data.categoryList[index],
      ),
      itemCount: widget.data.categoryList.length,
    );
  }
}

class _PackIcon extends StatefulWidget {
  ScrollController controller;
  final double index;
  final String avatarImagePath;
  final bool isSelected;
  final CategoryItemModel packItem;
  _PackIcon ({
    this.controller,
    this.index,
    this.avatarImagePath,
    this.isSelected,
    this.packItem,
  });

  @override
  _PackIconState createState() {
    return new _PackIconState();
  }
}

class _PackIconState extends State<_PackIcon> {

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        widget.controller.animateTo(widget.index * 200, duration: new Duration(seconds: 1), curve: Curves.ease);
        setState(() {
          _isSelected = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: new Container(
          height: _isSelected? 50 : 40,
          padding: EdgeInsets.all(5.0),
          child: ListTile(
            leading: Image.network(widget.avatarImagePath),
            title: Text(
              widget.packItem.name,
              style: TextStyle(color: Colors.white),
            ),
          )
        ),
      ),
    );
  }
}