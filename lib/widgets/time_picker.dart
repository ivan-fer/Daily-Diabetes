import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final Function(TimeOfDay) onTimeSet;
  final String labelText;
  final TimeOfDay initialTime;

  const TimePicker({Key key, this.onTimeSet, this.labelText, this.initialTime})
      : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _time = TimeOfDay.now();
  bool _firstTime = true;

  String _timeFormat() {
    String cad = '';
    if (_time.hour < 10) cad += '0';
    cad += '${_time.hour}:';
    if (_time.minute < 10) cad += '0';
    cad += '${_time.minute}';
    return cad;
  }

  _selectTime(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: _time ?? TimeOfDay.now(),
    ).then((value) {
      setState(() {
        if (value != null) {
          _time = value;
          widget.onTimeSet(_time);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_firstTime == true && widget.initialTime != null) {
      _time = widget.initialTime;
      _firstTime = false;
    }

    return Stack(
      overflow: Overflow.visible,
      children: [
        SizedBox(
          width: 160,
          height: 45,
          child: OutlineButton(
            onPressed: () => _selectTime(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_timeFormat()),
                Icon(
                  Icons.access_time,
                  size: 16,
                ),
              ],
            ),
            borderSide: BorderSide(color: Colors.black38),
          ),
        ),
        Positioned(
          left: 8,
          top: -6,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            color: Theme.of(context).canvasColor,
            child: Text(
              widget.labelText ?? 'hora',
              style: TextStyle(fontSize: 12),
            ),
          ),
        )
      ],
    );
  }
}
