import 'package:flutter/material.dart';
import '../constants.dart';

class DatePicker extends StatefulWidget {
  final Function(DateTime) onDateSet;
  final DateTime initialDate;

  const DatePicker({Key key, this.onDateSet, this.initialDate})
      : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _date;

  String _dateFormat() =>
      '${_date.day}-${monthList[_date.month - 1]}-${_date.year}';

  _selectDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((value) {
      setState(() {
        if (value != null && _date != value) {
          _date = value;
          widget.onDateSet(_date);
        }
      });
    });
  }

  @override
  void initState() {
    _date = widget.initialDate ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        SizedBox(
          width: 160,
          height: 45,
          child: OutlineButton(
            onPressed: () => _selectDate(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_dateFormat()),
                Icon(
                  Icons.date_range,
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
              'fecha',
              style: TextStyle(fontSize: 12),
            ),
          ),
        )
      ],
    );
  }
}
