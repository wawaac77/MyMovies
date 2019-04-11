import 'package:flutter/material.dart';
import 'package:my_movies/src/ui/pages/user_info_edit_page.dart';
import 'package:my_movies/src/ui/widgets/user_select_cell.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: new Wrap(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 150,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
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
          ),
          new ListTile(
              leading: new Icon(Icons.card_giftcard, color: Colors.white,),
              title: new Text(
                'SIM Card',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => {}
          ),
          new ListTile(
              leading: new Icon(Icons.cloud_circle, color: Colors.white,),
              title: new Text(
                'My Packs',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => {}
          ),
          new ListTile(
              leading: new Icon(Icons.payment, color: Colors.white,),
              title: new Text(
                'Wallet',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => {}
          ),
          new ListTile(
              leading: new Icon(Icons.settings, color: Colors.white,),
              title: new Text(
                'Setting',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserInfoEditPage()),
                );
              },
          ),
          new ListTile(
              leading: new Icon(Icons.help_outline, color: Colors.white,),
              title: new Text(
                'Help',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => {}
          ),
          new ListTile(
              leading: new Icon(Icons.call_missed_outgoing, color: Colors.white,),
              title: new Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () => {}
          ),
        ],
      ),
    );
  }
}
