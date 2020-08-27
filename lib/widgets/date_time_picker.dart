import 'package:flutter/material.dart';
import 'date_picker.dart';
import 'time_picker.dart';

class DateTimePicker extends StatefulWidget {
  final Function(DateTime) onDateTimeSet;
  final EdgeInsets margin;

  const DateTimePicker({Key key, this.onDateTimeSet, this.margin})
      : super(key: key);

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DatePicker(
            onDateSet: (date) {
              _date = DateTime(
                date.year,
                date.month,
                date.day,
                _time.hour,
                _time.minute,
              );
              widget.onDateTimeSet(_date);
            },
          ),
          TimePicker(
            onTimeSet: (time) {
              _time = time;
              _date = DateTime(
                _date.year,
                _date.month,
                _date.day,
                _time.hour,
                _time.minute,
              );
              widget.onDateTimeSet(_date);
            },
          ),
        ],
      ),
    );
  }
}
