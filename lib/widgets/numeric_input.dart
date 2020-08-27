import 'package:flutter/material.dart';

class NumericInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final EdgeInsets margin;

  const NumericInput({Key key, this.controller, this.label, this.margin})
      : super(key: key);

  @override
  _NumericInputState createState() => _NumericInputState();
}

class _NumericInputState extends State<NumericInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: 150,
      child: TextField(
        maxLength: 3,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.label,
          isDense: true,
        ),
      ),
    );
  }
}
