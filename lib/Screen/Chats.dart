import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/widgets/chat-item.dart';

class Chats extends StatelessWidget {
  List<Users> chatList = [
    Users("img1", "Hello1", "User1", "9:00 AM"),
    Users("img1", "Hello", "User1", "9:00 AM"),
    Users("img1", "Hello", "User1", "9:00 AM"),
    Users("img1", "Hello", "User1", "9:00 AM"),
    Users("img1", "Hello", "User1", "9:00 AM"),
    Users("img1", "Hello", "User1", "9:00 AM"),
    Users("img1", "Hello", "User1", "9:00 AM"),
    Users("img1", "Hello", "User1", "9:00 AM"),
    Users("img1", "Hello", "User1", "9:00 AM"),
    Users("img1", "Hello", "User1", "9:00 AM"),
    Users("img1", "Hello", "User1", "9:00 AM"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // padding: EdgeInsets.all(3),
        itemCount: chatList.length,
        itemBuilder: (ctx, i) {
          return Chat(chatList[i]);
        });
  }
}
