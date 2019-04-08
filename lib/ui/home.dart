import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_messages_clone/models/message.dart';
import 'utility/HexColor.dart';

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
  List<MaterialColor> myCustomMaterialColors = <MaterialColor>[];
  final random = Random();
  double _width = 56.0;
  bool isExtended = false;
  double appBarElevation = 0;

  @override
  void initState() {
    createSomePredefinedColors();
    createDummyData();
    super.initState();
  }

  void createDummyData() {
    messages.add(Message(
        from: "Alen",
        message: "hey, want to meed today",
        isRead: true,
        isInContactList: true,
    backgroundColor: myCustomMaterialColors[random.nextInt(myCustomMaterialColors.length)]));
    messages.add(Message(
        from: "Megan",
        message: "Hows party",
        isRead: true,
        isInContactList: true,
        backgroundColor: myCustomMaterialColors[random.nextInt(myCustomMaterialColors.length)]));
    messages.add(Message(
        from: "Mike",
        message: "Called you to inform something,will let you know later on",
        isRead: false,
        isInContactList: true,
        backgroundColor: myCustomMaterialColors[random.nextInt(myCustomMaterialColors.length)]));
    messages.add(Message(
        from: "963808326",
        message: "Got it",
        isRead: true,
        isInContactList: false,
        backgroundColor: myCustomMaterialColors[random.nextInt(myCustomMaterialColors.length)]));
    messages.add(Message(
        from: "Jireb",
        message: "Yes will come",
        isRead: false,
        isInContactList: true,
        backgroundColor: myCustomMaterialColors[random.nextInt(myCustomMaterialColors.length)]));
    messages.add(Message(
        from: "7854862541",
        message: "2 Missed call",
        isRead: true,
        isInContactList: false,
        backgroundColor: myCustomMaterialColors[random.nextInt(myCustomMaterialColors.length)]));
    messages.add(Message(
        from: "Harry",
        message: "I have bought it for you",
        isRead: false,
        isInContactList: true,
        backgroundColor: myCustomMaterialColors[random.nextInt(myCustomMaterialColors.length)]));
    messages.add(Message(
        from: "Wife",
        message: "Where are you right now?",
        isRead: true,
        isInContactList: true,
        backgroundColor: myCustomMaterialColors[random.nextInt(myCustomMaterialColors.length)]));
    messages.add(Message(
        from: "Kenny",
        message: "Are you there?",
        isRead: true,
        isInContactList: true,
        backgroundColor: myCustomMaterialColors[random.nextInt(myCustomMaterialColors.length)]));
    messages.add(Message(
        from: "Naresh",
        message: "Whats the status",
        isRead: true,
        isInContactList: true,
        backgroundColor: myCustomMaterialColors[random.nextInt(myCustomMaterialColors.length)]));
  }

  void createSomePredefinedColors() {
    myCustomMaterialColors.add(Colors.yellow);
    myCustomMaterialColors.add(Colors.orange);
    myCustomMaterialColors.add(Colors.purple);
    myCustomMaterialColors.add(Colors.pink);
    myCustomMaterialColors.add(Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages',
            style: TextStyle(
              letterSpacing: -1,
              color: Colors.grey[800],
            )),
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
          child: NotificationListener<ScrollNotification>(
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
                      backgroundColor: messages[index].backgroundColor.shade100,
                      radius: 23,
                      child: messages[index].isInContactList
                          ? Text(
                              '${messages[index].from.substring(0, 1)}',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Roboto',
                                  color: messages[index].backgroundColor.shade800),
                            )
                          : Icon(
                              Icons.person,
                              size: 30,
                              color: messages[index].backgroundColor.shade800 ,
                            ),
                    ),
                    title: Text(
                      '${messages[index].from}',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: messages[index].isRead
                              ? FontWeight.normal
                              : FontWeight.bold,
                          color: messages[index].isRead ? null : Colors.black),
                    ),
                    subtitle: Text(
                      '${messages[index].message}',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: messages[index].isRead
                              ? FontWeight.normal
                              : FontWeight.bold,
                          color: messages[index].isRead ? null : Colors.black),
                    ),
                  );
                }),
          )),
      floatingActionButton: AnimatedContainer(
        height: 56,
        width: _width,
        duration: Duration(milliseconds: 180),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: HexColor("1A73E8"),
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
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: isExtended
                      ? Text(
                          'Start chat',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 16),
                        )
                      : SizedBox.shrink(),
                )
              ],
            )
          ],
        ),
      ),
    );
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
      _width = isExtended ? 135 : 56;
      appBarElevation = isExtend ? 5 : 0;
    });
  }
}

//TODO option menu can be improved with list
//TODO proper font style with theme
//TODO code correction
//TODO random color
//TODO match exact color
//TODO library match coding standard with pedro
//Different option for color
