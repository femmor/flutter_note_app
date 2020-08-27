import 'package:flutter/material.dart';

// Change page title based on action - (Editing or adding)
enum NoteMode {
  Editing,
  Adding,
}

class Note extends StatelessWidget {
  final NoteMode _noteMode;

  Note(this._noteMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_noteMode == NoteMode.Adding ? "Add Note" : "Edit Note"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "What do you want to do today?...",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Note title",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Note text",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NoteButton("Save", Colors.blue, () => Navigator.pop(context)),
                _NoteButton(
                    "Discard", Colors.grey, () => Navigator.pop(context)),
                _noteMode == NoteMode.Editing
                    ? Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: _NoteButton(
                            "Delete", Colors.red, () => Navigator.pop(context)),
                      )
                    : Column(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Note button
class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white),
      ),
      color: _color,
      height: 40.0,
      minWidth: 100.0,
    );
  }
}
