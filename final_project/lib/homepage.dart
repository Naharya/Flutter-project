import 'package:flutter/material.dart';
import 'newNote.dart';
import 'editNote.dart';
import 'package:final_project/db.dart';

class AddNote extends StatelessWidget {
  var listView;

  initState() {
    DBHelper.dbHelper.getAllNote();
  }

  Widget emptyNotes() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/2.png",
            width: 300,
            height: 200,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "You don't have any Notes",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget viewNotes() {
    return Scrollbar(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
        ),
        child: listView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(onTap: () {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //todo add note(title) from index
                  "controller.notes[index].title",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  //todo add note(content) from index
                  "controller.notes[index].content,",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  maxLines: 6,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1321E0),
        title: Center(
          child: Text("My Notes",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            /*ListView.builder(itemBuilder: ((context, index) {
                return Card(

                );
              }))*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1321E0),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NewNote(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}  
      
      
      
      




















      /*Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/2.png",
              width: 300,
              height: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "You don't have any Notes",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1321E0),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NewNote(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      /*body: GetBuilder<NoteController>(
        builder: (_) => controller.isEmpty() ? emptyNotes() : viewNotes(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1321E0),
        onPressed: () {
          Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NewNote()),
              );
        },
        child: Icon(
          Icons.add,
        ),
      ),*/
    );*/
  

