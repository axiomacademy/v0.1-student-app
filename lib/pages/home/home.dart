import 'package:flutter/material.dart';

import '../../components/text_fields.dart';
import '../../components/list_items.dart';

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
        child: ListView(shrinkWrap: true, children: <Widget>[
          Row(children: <Widget>[
            Expanded(
                child: FilledTextFormField(
                    labelText: "Search",
                    prefixIcon: Icon(Icons.search, size: 25.0),
                    validator: (input) {})),
            IconButton(
                padding: EdgeInsets.only(left: 10.0, right: 0.0),
                onPressed: () {},
                icon: Icon(Icons.menu, color: Color(0xFF5B5B5B), size: 25.0)),
          ]),
          Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 0.0),
              child: Text("Upcoming Sessions",
                  style: Theme.of(context).textTheme.headline6)),
          UpcomingListItem(
              active: true,
              readableDate: "Happening now",
              readableTime: "",
              subject: "Physics 101",
              tutorName: "Arvinderjit Singh",
              tutorImage:
                  "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg"),
          UpcomingListItem(
              readableDate: "In 2 days",
              readableTime: "10 - 11AM",
              subject: "AP Economics",
              tutorName: "Jasmine Sylvia",
              tutorImage: "https://s3.envato.com/files/236560326/preview.jpg"),
          Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 0.0),
              child: Text("Recent Sessions",
                  style: Theme.of(context).textTheme.headline6)),
          SubjectListItem(
              subject: "Physics",
              date: "26 June 2020",
              duration: "15 mins",
              description:
                  "Went through the basics of circular motion and summarised concepts on pressure"),
          SubjectListItem(
              subject: "Mathematics",
              date: "25 June 2020",
              duration: "2 hours",
              description:
                  "Discussing and summarizing pre-calculus, touching on limits"),
          SubjectListItem(
              subject: "Economics",
              date: "20 June 2020",
              duration: "1 hour",
              description:
                  "Taught supply-demand curves, price inelasticity and other key concepts"),
          SubjectListItem(
              subject: "Chemistry",
              date: "20 June 2020",
              duration: "2 hours",
              description: "Exam revision and prep-work"),
          SubjectListItem(
              subject: "Physics",
              date: "14 June 2020",
              duration: "2 hours",
              description: "Went through specific gravity, bouyancy concepts"),
        ]),
      )),
      floatingActionButton: FloatingActionButton.extended(
          splashColor: Color(0xFF8E58DF),
          onPressed: () {},
          label: Text('Book'.toUpperCase()),
          icon: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor),
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
