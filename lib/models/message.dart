import 'package:flutter/material.dart';

class Message {
  String from;
  String message;
  bool isRead;
  bool isInContactList;
  MaterialColor backgroundColor;

  Message({this.from,this.message,this.isRead,this.isInContactList,this.backgroundColor});
}