import 'package:flutter/material.dart';
import 'package:card_settings/card_settings.dart';

class UserInfoEditPage extends StatefulWidget {
  @override
  _UserInfoEditPageState createState() => _UserInfoEditPageState();
}

class _UserInfoEditPageState extends State<UserInfoEditPage> {
  String title = "Club SIM";
  String countryCode = 'Hong Kong (+852)';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
          FlatButton(onPressed: null, child: Text('Update', style: TextStyle(color: Colors.white),)),
        ],
      ),
      body: Form(
        key: _formKey,
        child: CardSettings(
          children: <Widget>[
            CardSettingsHeader(label: 'Personal Info'),
            CardSettingsText(
              label: 'Email',
              initialValue: title,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Email is required.';
              },
              onSaved: (value) => title = value,
            ),
            CardSettingsListPicker(
              label: 'Country Code',
              initialValue: countryCode,
              options: ['Hong Kong (+852)', 'China (+86)', 'Macau (+853)', 'United States (+1)'],
              onSaved: (value) => setState(() => countryCode = value),
            ),
            CardSettingsText(
              label: 'Mobile Number',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Mobile Number is required.';
              },
              onSaved: (value) => title = value,
            ),
            CardSettingsHeader(label: 'Contact Info'),
            CardSettingsText(
              label: 'Flat',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Info is required.';
              },
              onSaved: (value) => title = value,
            ),
            CardSettingsText(
              label: 'Floor',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Info is required.';
              },
              onSaved: (value) => title = value,
            ),
            CardSettingsText(
              label: 'Block',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Info is required.';
              },
            ),
            CardSettingsText(
              label: 'Name of Building',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Info is required.';
              },
            ),
            CardSettingsText(
              label: 'Street Name',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Info is required.';
              },
            ),
          ],
        ),
      ),
    );
  }
}
