import 'package:flutter/material.dart';

import '../../components/text_fields.dart';
import '../../components/avatar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Expanded(
                          child: FilledTextFormField(
                              labelText: "Search",
                              prefixIcon: Icon(Icons.search, size: 25.0),
                              validator: (input) {})),
                      IconButton(
                          padding: EdgeInsets.only(left: 10.0, right: 0.0),
                          onPressed: () {},
                          icon: Icon(Icons.menu,
                              color: Color(0xFF5B5B5B), size: 25.0)),
                    ]),
                    Text("Upcoming Sessions",
                        style: Theme.of(context).textTheme.headline6),
                    Container(
                        padding: EdgeInsets.only(right: 0.0, left: 0.0),
                        child: Row(children: <Widget>[
                          UserAvatar(
                            "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg",
                          ),
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(left: 12.0),
                                  padding:
                                      EdgeInsets.only(top: 10.0, bottom: 15.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xFFE0E0E0),
                                              width: 1.0))),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.0, bottom: 5.0),
                                            child: Text("TODAY",
                                                style: Theme.of(context)
                                                    .accentTextTheme
                                                    .overline
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500))),
                                        Text("Physics 101",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text("Arvinderjit Singh",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    .copyWith(
                                                        color: Color(
                                                            0xFF666666)))),
                                      ]))),
                        ])),
                  ]))),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color(0x99FFFFFF),
        selectedItemColor: Color(0xFFFFFFFF),
        selectedFontSize: 12,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text('Scheduled'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            title: Text('Notes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    ));
  }
}
