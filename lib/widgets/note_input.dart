import 'package:flutter/material.dart';

class NoteInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onNoteChanged;
  final EdgeInsets margin;

  const NoteInput({Key key, this.controller, this.onNoteChanged, this.margin})
      : super(key: key);

  @override
  _NoteInputState createState() => _NoteInputState();
}

class _NoteInputState extends State<NoteInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextField(
        maxLength: 150,
        controller: widget.controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onChanged: (text) => widget.onNoteChanged(text),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'nota',
          isDense: true,
        ),
      ),
    );
  }
}
