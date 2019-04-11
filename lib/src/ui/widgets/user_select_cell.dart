import 'package:flutter/material.dart';

class UserSelectCell extends StatelessWidget {
  String profileImgUrl;
  String userName;
  String userSim;

  UserSelectCell ({
    this.profileImgUrl,
    this.userName,
    this.userSim,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          new Container(
            width: 60,
            height: 60,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: profileImgUrl.length > 0 ? NetworkImage(profileImgUrl)
                    : NetworkImage('https://www.qualiscare.com/wp-content/uploads/2017/08/default-user.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Text(
            userName,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            userSim,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
