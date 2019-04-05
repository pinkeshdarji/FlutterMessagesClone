import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_messages_clone/models/message.dart';

enum Options {
  archived,
  markAllAsRead,
  blockedContacts,
  messagesForWeb,
  darkMode,
  settings,
  helpAndFeedback
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Message> messages = <Message>[];
  final random = Random();
  double _width = 56.0;
  bool isExtended = false;
  double appBarElevation = 0;

  @override
  void initState() {
    messages.add(Message(from: "Alen", message: "hey, want to meed today"));
    messages.add(Message(from: "Megan", message: "Hows party"));
    messages.add(Message(
        from: "Mike",
        message:
            "I have called you to onform something,will let you know later on"));
    messages.add(Message(from: "Jhon", message: "Got it"));
    messages.add(Message(from: "Jireb", message: "Yes will come"));
    messages.add(Message(from: "Sundar", message: "Will attend"));
    messages.add(Message(from: "Harry", message: "I have bought it for you"));
    messages.add(Message(from: "Wife", message: "Where are you right now?"));
    messages.add(Message(from: "Kenny", message: "Are you there?"));
    messages.add(Message(from: "Naresh", message: "Whats the status"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Messages',
              style: TextStyle(letterSpacing: -1, color: Colors.grey[800])),
          elevation: appBarElevation,
          centerTitle: true,
          actions: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.search,
                  color: Colors.grey[800],
                )),
            Container(
              child: optionMenu(),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
            child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: <Widget>[
            NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is UserScrollNotification) {
                  switch (scrollNotification.direction) {
                    case ScrollDirection.reverse:
                      extendFab(true);
                      break;
                    case ScrollDirection.forward:
                      extendFab(false);
                      break;
                    case ScrollDirection.idle:
                      break;
                  }
                }
              },
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightBlue.shade100,
                        radius: 23,
                        child: Text(
                          '${messages[index].from.substring(0, 1)}',
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              color: Colors.lightBlue[800]),
                        ),
                      ),
                      title: Text(
                        '${messages[index].from}',
                        style: TextStyle(fontFamily: 'Roboto'),
                      ),
                      subtitle: Text(
                        '${messages[index].message}',
                        style: TextStyle(fontFamily: 'Roboto'),
                      ),
                    );
                  }),
            ),
            AnimatedContainer(
              height: 56,
              width: _width,
              constraints: BoxConstraints(minWidth: 56, maxWidth: 120),
              duration: Duration(milliseconds: 180),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                      Container(
                        child: isExtended
                            ? Text(
                                'Start chat',
                                style: TextStyle(fontFamily: 'Roboto'),
                              )
                            : SizedBox.shrink(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )));
  }

  PopupMenuButton<Options> optionMenu() {
    return PopupMenuButton<Options>(
      onSelected: (Options result) {
        print(result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
            const PopupMenuItem<Options>(
              value: Options.archived,
              child: Text(
                'Archived',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
            ),
            const PopupMenuItem<Options>(
              value: Options.markAllAsRead,
              child: Text(
                'Mark all as read',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
            ),
            const PopupMenuItem<Options>(
              value: Options.blockedContacts,
              child: Text(
                'Blocked contacts',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
            ),
            const PopupMenuItem<Options>(
              value: Options.messagesForWeb,
              child: Text(
                'Messages for web',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
            ),
            const PopupMenuItem<Options>(
              value: Options.darkMode,
              child: Text(
                'Enable dark mode',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
            ),
            const PopupMenuItem<Options>(
              value: Options.settings,
              child: Text(
                'Settings',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
            ),
            const PopupMenuItem<Options>(
              value: Options.helpAndFeedback,
              child: Text(
                'Help & feedback',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
            ),
          ],
    );
  }

  extendFab(bool isExtend) {
    setState(() {
      isExtended = isExtend;
      _width = isExtended ? 120 : 56;
      appBarElevation = isExtend ? 5 : 0;
    });
  }
}

//TODO option menu can be improved with list
//TODO proper font style with theme
//TODO code correction
//TODO random color
//TODO library match coding standard with pedro
//Different option for color
