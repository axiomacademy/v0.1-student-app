import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';

import '../components/avatar.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: Container(
                    color: Theme.of(context).primaryColor,
                    padding:
                        EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
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
            body: DashChat(
              user: ChatUser(
                name: "Jhon Doe",
                uid: "xxxxxxxxx",
                avatar:
                    "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
              ),
              messages: <ChatMessage>[
                ChatMessage(
                  text: "Hello",
                  user: ChatUser(
                    name: "Fayeed",
                    uid: "123456789",
                    avatar:
                        "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
                  ),
                  createdAt: DateTime.now(),
                  image:
                      "http://www.sclance.com/images/picture/Picture_753248.jpg",
                )
              ],
              onSend: (message) {},
            )));
  }
}
