import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/widgets/actions_ok_cancel.dart';
import 'package:daily_diabetes/widgets/date_picker.dart';
import 'package:daily_diabetes/widgets/note_input.dart';
import 'package:daily_diabetes/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:moor/moor.dart' hide Column;
import 'package:provider/provider.dart';

import '../constants.dart';

class ActivityRegistryPage extends StatefulWidget {
  @override
  _ActivityRegistryPageState createState() => _ActivityRegistryPageState();
}

class _ActivityRegistryPageState extends State<ActivityRegistryPage> {
  String _dropDownValue = activityList[0];
  TextEditingController _titleController;
  TextEditingController _noteController;
  DateTime _date = DateTime.now();
  TimeOfDay _timeIni = TimeOfDay.now();
  TimeOfDay _timeFin = TimeOfDay(
    hour: TimeOfDay.now().hour + 1,
    minute: TimeOfDay.now().minute,
  );

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    if (_noteController != null && _titleController != null) {
      _noteController.dispose();
      _titleController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarRegistry('Registrar Actividad'),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(),
                buildActivityType(),
                DatePicker(
                  onDateSet: (date) {
                    _date = date;
                  },
                ),
                buildTimeDuration(),
                NoteInput(
                  margin: const EdgeInsets.only(bottom: 16),
                  controller: _noteController,
                ),
                OkCancelActions(
                  onOk: () {
                    final adao = Provider.of<DiabetesDatabase>(context).activityDao;
                    adao.insertThis(ActivitiesCompanion(
                      name: Value(_titleController.text),
                      type: Value(_dropDownValue),
                      date: Value(_date),
                      timeIni: Value(DateTime(_date.year, _date.month,
                          _date.day, _timeIni.hour, _timeIni.minute)),
                      timeEnd: Value(DateTime(_date.year, _date.month,
                          _date.day, _timeFin.hour, _timeFin.minute)),
                      note: Value(_noteController.text),
                    ));
                    Navigator.pop(context, true);
                  },
                  onCancel: () => Navigator.pop(context, false),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container buildTimeDuration() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TimePicker(
            labelText: 'inicio',
            onTimeSet: (time) {
              _timeIni = time;
            },
          ),
          TimePicker(
            labelText: 'fin',
            initialTime: TimeOfDay(
              hour: TimeOfDay.now().hour + 1,
              minute: TimeOfDay.now().minute,
            ),
            onTimeSet: (time) {
              _timeFin = time;
            },
          ),
        ],
      ),
    );
  }

  TextField buildTitle() {
    return TextField(
      controller: _titleController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'título',
        isDense: true,
        hintText: 'nombre para esta actividad',
      ),
    );
  }

  Container buildActivityType() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Colors.black38,
          width: 1,
        ),
      ),
      child: DropdownButton(
        value: _dropDownValue,
        isExpanded: true,
        iconSize: 30,
        onChanged: (String newValue) {
          setState(() {
            _dropDownValue = newValue;
          });
        },
        items: activityList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
