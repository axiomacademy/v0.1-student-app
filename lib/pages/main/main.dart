import 'package:flutter/material.dart';

import "../booking_bottom_sheet/main.dart";
import 'home_view.dart';
import 'schedule_view.dart';

/// Main Page
class MainPage extends StatefulWidget {
  /// Default main page constructor
  MainPage({Key key}) : super(key: key);

  /// Convenience method to route to WelcomePage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => MainPage());
  }

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
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                builder: (context) {
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
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: "Scheduled",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
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
