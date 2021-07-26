import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multilangauge_app/langauge.dart';
import 'package:multilangauge_app/localization/demo_localization.dart';
import 'package:multilangauge_app/localization/localization_constants.dart';
import 'package:multilangauge_app/routes/route_names.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _changeLanguage(Language language) {
    Locale _temp;

    switch (language.langaugeCode) {
      case 'en':
        _temp = Locale(language.langaugeCode, 'US');
        break;
      case 'ar':
        _temp = Locale(language.langaugeCode, "SA");
        break;
      default:
        _temp = Locale(language.langaugeCode, "US");
    }

    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerList(),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(DemoLocalization.of(context).getTranslate('home_page')),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              onChanged: (Language language) {
                _changeLanguage(language);
              },
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text(lang.flag), Text(lang.name)],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: _mainForm(context),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: Text(
                (getTranslated(context, 'personal_info')),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TextFormField(
            validator: (val) {
              if (val.isEmpty) {
                return "required field";
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: getTranslated(context, 'name'),
                hintText: 'enter name'),
          ),
          SizedBox(height: 10),
          TextFormField(
            validator: (val) {
              if (val.isEmpty) {
                return "required field";
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: getTranslated(context, 'email'),
                hintText: 'enter name'),
          ),
          SizedBox(height: 10),
          // TextFormField(
          //   validator: (val) {
          //     if (val.isEmpty) {
          //       return "required field";
          //     }
          //     return null;
          //   },
          //   decoration: InputDecoration(
          //       border: OutlineInputBorder(),
          //       labelText: 'family name',
          //       hintText: 'enter name'),
          // ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              if (_key.currentState.validate()) {
                // _showsuccessDialoug();
              }
            },
            height: 50,
            color: Colors.cyan,
            child: Center(
              child: Text(
                getTranslated(context, 'submit_info'),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _drawerList() {
    TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: CircleAvatar(),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              'About us',
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              'Settings',
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}
