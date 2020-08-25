import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';

import '../components/avatar.dart';
import '../components/buttons.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessage> messages = [
    ChatMessage(
      text: "Hello how are you doing?",
      user: ChatUser(
        name: "Fayeed",
        uid: "123456789",
        avatar:
            "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
      ),
      createdAt: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: Container(
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.only(
                        left: 5.0, right: 5.0, bottom: 5.0, top: 5.0),
                    child: SafeArea(
                        child: Row(children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 25.0,
                          color: Colors.white,
                          onPressed: () {}),
                      UserAvatar(
                          "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg",
                          width: 40.0,
                          height: 40.0),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Physics 101",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.white))),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.volume_off),
                          iconSize: 25.0,
                          color: Colors.white,
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(Icons.more_vert),
                          iconSize: 25.0,
                          color: Colors.white,
                          onPressed: () {}),
                    ])))),
            body: Theme(
                data: Theme.of(context)
                    .copyWith(accentColor: Theme.of(context).primaryColor),
                child: DashChat(
                    user: ChatUser(
                      name: "Jhon Doe",
                      uid: "xxxxxxxxx",
                    ),
                    messages: messages,
                    showUserAvatar: false,
                    onSend: (message) {
                      setState(() {
                        messages.add(message);
                      });
                    },
                    avatarBuilder: (user) {
                      return Container();
                    },
                    dateFormat: DateFormat.yMMMMd('en_US'),
                    timeFormat: DateFormat.jm(),
                    /*dateBuilder: (date) {
                        return Chip(
                            backgroundColor: Color(0xFFDD1155),
                            label: Text(date,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(color: Colors.white)));
                      },*/
                    leading: <Widget>[
                      IconButton(
                          icon: Icon(Icons.image),
                          color: Color(0xFF1D1E2D),
                          onPressed: () {})
                    ],
                    sendButtonBuilder: (pressed) {
                      return IconButton(
                          icon: Icon(Icons.send),
                          color: Color(0xFF1D1E2D),
                          onPressed: pressed);
                    },
                    inputContainerStyle: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    scrollToBottomStyle: ScrollToBottomStyle(
                        bottom: 100.0, left: 20.0, right: 20.0),
                    inputFooterBuilder: () {
                      return SafeArea(
                          child: Container(
                        padding: EdgeInsets.only(left: 15.0, right: 5.0),
                        child: Row(children: <Widget>[
                          Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                  color: Color(0xFFDD1155),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)))),
                          Padding(
                              padding: EdgeInsets.only(left: 7.0),
                              child: Text("1min 50s".toUpperCase(),
                                  style: Theme.of(context)
                                      .accentTextTheme
                                      .overline
                                      .copyWith(fontWeight: FontWeight.w600))),
                          Spacer(),
                          TextIconFlatButton(
                              text: "End", icon: Icons.close, onPressed: () {})
                        ]),
                      ));
                    }))));
  }
}
