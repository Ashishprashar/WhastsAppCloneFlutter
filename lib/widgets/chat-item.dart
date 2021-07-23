import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';

class Chat extends StatelessWidget {
  // const ChatItem({ Key? key }) : super(key: key);
  final Users u;

  Chat(this.u);
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              "https://assets.entrepreneur.com/content/3x2/2000/20190502194704-ent19-june-editorsnote.jpeg?width=700&crop=2:1",
            ),
          ),
          title: Text(u.name, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(
            u.msg,
          ),
          trailing: Text(u.time),
          contentPadding: EdgeInsets.only(left: 10, right: 10),
        ),
        Container(
          padding: EdgeInsets.only(left: 90, right: 10),
          // width: MediaQuery.of(context).size.width - 100,
          child: Divider(
            // thickness: MediaQuery.of(context).size.width - 100,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
