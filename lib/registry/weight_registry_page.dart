import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/widgets/actions_ok_cancel.dart';
import 'package:daily_diabetes/widgets/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:moor/moor.dart' hide Column;
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class WeightRegistryPage extends StatefulWidget {
  @override
  _WeightRegistryPageState createState() => _WeightRegistryPageState();
}

class _WeightRegistryPageState extends State<WeightRegistryPage> {
  double _cval = 70.5;
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarRegistry('Registrar Peso'),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberPicker.decimal(
                        initialValue: _cval,
                        minValue: 30,
                        maxValue: 200,
                        onChanged: (value) => setState(() => _cval = value),
                      ),
                      Text('Kg'),
                    ],
                  ),
                ),
                DateTimePicker(
                  onDateTimeSet: (d) {
                    _date = d;
                  },
                  margin: const EdgeInsets.only(bottom: 16),
                ),
                OkCancelActions(
                  onOk: () {
                    final wdao =
                        Provider.of<DiabetesDatabase>(context).weightDao;
                    wdao.insertThis(WeightsCompanion(
                      weight: Value(_cval),
                      date: Value(_date),
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
}
