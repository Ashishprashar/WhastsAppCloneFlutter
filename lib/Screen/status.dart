import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/status-item.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              height: 80,
              width: 70,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 60,
                      width: 60,
                      child: Image.network(
                        "https://assets.entrepreneur.com/content/3x2/2000/20190502194704-ent19-june-editorsnote.jpeg?width=700&crop=2:1",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            title: Text(
              "My Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Tap to add status update"),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.shade300,
            // height: 30,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text("Recent Updates"),
          ),
          StatusItem(false),
          Container(
            width: double.infinity,
            color: Colors.grey.shade300,
            // height: 30,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text("Viewed Updates"),
          ),
          StatusItem(true)
        ],
      ),
    );
  }
}
