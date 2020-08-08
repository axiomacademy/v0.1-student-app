import 'package:flutter/material.dart';

import 'home_view.dart';
import 'schedule_view.dart';
import "booking_bottom_sheet.dart";

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: PageView(
          controller: _controller,
          children: <Widget>[HomeView(), ScheduleView()]),
      floatingActionButton: FloatingActionButton.extended(
          splashColor: Color(0xFF8E58DF),
          onPressed: () {
            showModalBottomSheet<void>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                builder: (BuildContext context) {
                  return BookingBottomSheet();
                });
          },
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

          if (_controller.hasClients) {
            _controller.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          }
        },
      ),
    ));
  }
}
