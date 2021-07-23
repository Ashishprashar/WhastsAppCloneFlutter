import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/call.dart';

class Calls extends StatelessWidget {
  List<Call> dummy_data = [
    Call("User 1", "13 July, 7:47pm: ", false, "incoming", "video"),
    Call("User 1", "14 July, 7:47pm: ", true, "incoming", "video"),
    Call("User 1", "12 July, 5:45pm: ", true, "incoming", "audio"),
    Call("User 1", "11 July, 12:47pm: ", true, "outgoing", "video"),
    Call("User 1", "11 July, 7:30pm: ", false, "outgoing", "video"),
    Call("User 1", "10 July, 7:47pm: ", true, "outgoing", "audio"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummy_data.length,
        itemBuilder: (ctx, i) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 26,
                  backgroundImage: NetworkImage(
                    "https://assets.entrepreneur.com/content/3x2/2000/20190502194704-ent19-june-editorsnote.jpeg?width=700&crop=2:1",
                  ),
                ),
                title: Text(
                  dummy_data[i].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      dummy_data[i].type == "incoming"
                          ? Icons.call_received
                          : Icons.call_made,
                      color: dummy_data[i].status ? Colors.green : Colors.red,
                    ),
                    Text(
                      dummy_data[i].dateTime,
                    )
                  ],
                ),
                trailing: Icon(
                  dummy_data[i].mode == "video" ? Icons.videocam : Icons.call,
                  color: Colors.green.shade900,
                  size: 30,
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 90, right: 10, bottom: 0, top: 0),
                // margin: EdgeInsets.all(0),
                // width: MediaQuery.of(context).size.width - 100,
                child: Divider(
                  // thickness: MediaQuery.of(context).size.width - 100,
                  color: Colors.black,
                ),
              ),
            ],
          );
        });
  }
}
