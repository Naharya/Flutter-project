import 'package:final_project/models/note.dart';
import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.blue,
  Colors.orange,
  Colors.red,
  Colors.pink,
  Colors.yellow,
  Colors.green,
  Colors.black,
  Colors.orange,
  Colors.red,
  Colors.pink,
  Colors.yellow,
  Colors.green,
  Colors.black,
];

Widget colorCircule(Color color) => CircleAvatar(
      radius: 30,
      backgroundColor: color,
    );

class Editnote extends StatelessWidget {
  const Editnote(Note note, String title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        backgroundColor: Color(0xFF1321E0),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Color(0xFF1321E0),
                  context: context,
                  builder: (context) {
                    return Container(
                        margin: EdgeInsets.all(20),
                        height: 200,
                        width: double.infinity,
                        color: Color(0xFF1321E0),
                        alignment: Alignment.center,
                        child: Column(children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 207, 210, 221),
                                child: Icon(
                                  Icons.share,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Shere with your frind",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 207, 210, 221),
                                child: Icon(Icons.delete, color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Delete",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 207, 210, 221),
                                child: Icon(Icons.control_point_duplicate_sharp,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Duplicate",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              height: 30,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    colorCircule(colors[index]),
                                itemCount: colors.length,
                              )),
                        ]));
                  });
            },
            icon: Icon(Icons.more_vert),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "ghfhfhd",
              style: TextStyle(color: Colors.lightBlue),
            ),
            SizedBox(
              height: 10,
            ),
            Text("kjjkjbhbmjhmhhghghghgng")
          ],
        ),
      ),
    );
  }
}
