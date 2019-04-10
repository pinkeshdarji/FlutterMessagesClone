import 'package:flutter/material.dart';

enum Options {
  archived,
  markAllAsRead,
  blockedContacts,
  messagesForWeb,
  darkMode,
  settings,
  helpAndFeedback
}

class OptionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
