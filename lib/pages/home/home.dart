import 'package:flutter/material.dart';

import '../../components/text_fields.dart';

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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
              child: Container(
                  margin: EdgeInsets.only(left: 20.0, right: 10.0, top: 8.0),
                  child: Row(children: <Widget>[
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
                  ])))),
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
