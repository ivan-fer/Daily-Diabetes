import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/widgets/actions_ok_cancel.dart';
import 'package:daily_diabetes/widgets/date_time_picker.dart';
import 'package:daily_diabetes/widgets/note_input.dart';
import 'package:daily_diabetes/widgets/numeric_input.dart';
import 'package:daily_diabetes/widgets/select_moment.dart';
import 'package:flutter/material.dart';
import 'package:moor/moor.dart' hide Column;
import 'package:provider/provider.dart';

import '../constants.dart';

class GlucoseRegistryPage extends StatefulWidget {
  @override
  _GlucoseRegistryPageState createState() => _GlucoseRegistryPageState();
}

class _GlucoseRegistryPageState extends State<GlucoseRegistryPage> {
  TextEditingController _levelController;
  TextEditingController _noteController;

  String _moment;
  DateTime _date;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
    _levelController = TextEditingController();
    _date = DateTime.now();
    _moment = '';
  }

  @override
  void dispose() {
    if (_noteController != null && _levelController != null) {
      _noteController.dispose();
      _levelController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarRegistry('Registrar Glucemia'),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NumericInput(
                  controller: _levelController,
                  label: 'nivel',
                  margin: const EdgeInsets.only(bottom: 12),
                ),
                SelectMoment(
                  onSelectedChip: (selected) => _moment = selected,
                  margin: const EdgeInsets.only(bottom: 16),
                ),
                DateTimePicker(
                  margin: const EdgeInsets.only(bottom: 20),
                  onDateTimeSet: (d) {
                    _date = d;
                  },
                ),
                NoteInput(
                  controller: _noteController,
                  margin: const EdgeInsets.only(bottom: 16),
                ),
                OkCancelActions(
                  onOk: () {
                    if (_levelController.text == '') {
                      Scaffold.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(
                                  Icons.add_alert,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Debes agregar el nivel de azúcar',
                                ),
                              ],
                            ),
                          ),
                        );
                    } else {
                      final gdao =
                          Provider.of<DiabetesDatabase>(context, listen: false)
                              .glucoseDao;
                      gdao.insertThis(
                        GlucosesCompanion(
                          level: Value(int.parse(_levelController.text)),
                          moment: Value(_moment),
                          date: Value(_date),
                          note: Value(_noteController.text),
                        ),
                      );
                      Navigator.pop(context, true);
                    }
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
}
