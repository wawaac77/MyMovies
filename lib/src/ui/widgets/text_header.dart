import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  String title;
  String subTitle;
  TextHeader ({
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text (
            subTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
