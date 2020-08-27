import 'package:flutter/material.dart';
import 'package:flutter_note/screens/note_list.dart';

void main() {
  runApp(MaterialApp(
      title: "Notes",
      home: NoteList(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: Colors.green[600],
        accentColor: Colors.green[500],
      )));
}
