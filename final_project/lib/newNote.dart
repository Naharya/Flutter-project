import 'dart:js';

import 'package:final_project/editNote.dart';
import 'package:final_project/models/note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/homepage.dart';
import 'package:final_project/db.dart';

List<Color> colors = [
  const Color(0xFFFFFFFF),
  const Color(0xffF28B83),
  const Color(0xFFFCBC05),
  const Color(0xFFFFF476),
  const Color(0xFFCBFF90),
  const Color(0xFFA7FEEA),
  const Color(0xFFE6C9A9),
  const Color(0xFFE8EAEE),
  const Color(0xFFA7FEEA),
  const Color(0xFFCAF0F8)
];

Widget colorCircule(Color color) => CircleAvatar(
      radius: 30,
      backgroundColor: color,
    );

class NewNote extends StatelessWidget {
  late String title;
  late String description;
  GlobalKey<FormState> formkey = GlobalKey();

  Saveform() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      Note note = Note(title, description);
      DBHelper.dbHelper.insertNewNote(note);
      setState(() {});

      //Navigator.of(context).pop(note);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1321E0),
        title: const Text("New Note",
            style: TextStyle(fontSize: 20, color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: const Color(0xFF1321E0),
                  context: context,
                  builder: (context) {
                    return Container(
                        margin: const EdgeInsets.all(20),
                        height: 250,
                        width: double.infinity,
                        color: const Color(0xFF1321E0),
                        alignment: Alignment.center,
                        child: Column(children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 207, 210, 221),
                                child: Icon(
                                  Icons.share,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Shere with your frind",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 207, 210, 221),
                                child: Icon(Icons.delete, color: Colors.black),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Delete",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 207, 210, 221),
                                child: Icon(Icons.control_point_duplicate_sharp,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Duplicate",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              height: 40,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) =>
                                    colorCircule(colors[index])),
                                itemCount: colors.length,
                              )),
                        ]));
                  });
            },
            icon: const Icon(Icons.more_vert),
          ),
          IconButton(
            onPressed: () {
              Saveform();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Form(
        key: formkey,
        child: Container(
            margin: const EdgeInsets.only(top: 30, left: 40, right: 40),
            child: Column(children: [
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onSaved: (Value) {
                  this.title = Value!;
                },
                validator: (Value) {
                  if (Value!.isEmpty || Value.length == 0) {
                    return "please enter this feild!";
                  }
                },
                decoration: const InputDecoration(
                    hintText: ("Title...."),
                    hintStyle: const TextStyle(
                        color: const Color(0xFF1321E0), fontSize: 20)),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: TextFormField(
                  onSaved: (Value) {
                    this.description = Value!;
                  },
                  validator: (Value) {
                    if (Value!.isEmpty || Value.length == 0) {
                      return "please enter this feild!";
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: ("Description....."),
                      hintStyle:
                          TextStyle(color: Color(0xFF1321E0), fontSize: 20)),
                ),
              ),
            ])),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
/*
void setState(Null Function() param0) {}

class ColorPicker extends StatefulWidget {
  final Function(int) onTap;
  final int selectedIndex;
  const ColorPicker(
      {Key? key, required this.onTap, required this.selectedIndex})
      : super(key: key);
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late int selectedIndex;
  Widget build(BuildContext context) {
    selectedIndex;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTap(index);
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: 50,
              height: 30,
              child: Container(
                child: Center(
                    child: selectedIndex == index
                        ? const Icon(Icons.done)
                        : Container()),
                decoration: BoxDecoration(
                    color: colors[index],
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black)),
              ),
            ),
          );
        },
      ),
    );
  }
}*/
