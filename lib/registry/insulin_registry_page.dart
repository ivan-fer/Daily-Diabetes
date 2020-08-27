import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/widgets/actions_ok_cancel.dart';
import 'package:daily_diabetes/widgets/date_time_picker.dart';
import 'package:daily_diabetes/widgets/numeric_input.dart';
import 'package:daily_diabetes/widgets/select_moment.dart';
import 'package:flutter/material.dart';
import 'package:moor/moor.dart' hide Column;
import 'package:provider/provider.dart';

import '../constants.dart';

class InsulinRegistryPage extends StatefulWidget {
  @override
  _InsulinRegistryPageState createState() => _InsulinRegistryPageState();
}

class _InsulinRegistryPageState extends State<InsulinRegistryPage> {
  TextEditingController _dosisController;
  String _moment;
  DateTime _date;

  @override
  void initState() {
    super.initState();
    _dosisController = TextEditingController();
    _moment = '';
    _date = DateTime.now();
  }

  @override
  void dispose() {
    if (_dosisController != null) {
      _dosisController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarRegistry('Registrar Insulina'),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NumericInput(
                  controller: _dosisController,
                  label: 'dosis',
                  margin: const EdgeInsets.only(bottom: 16),
                ),
                SelectMoment(
                  onSelectedChip: (selected) => _moment = selected,
                  margin: const EdgeInsets.only(bottom: 16),
                ),
                DateTimePicker(
                  onDateTimeSet: (d) {
                    _date = d;
                  },
                  margin: const EdgeInsets.only(bottom: 16),
                ),
                OkCancelActions(
                  onOk: () {
                    if (_dosisController.text == '') {
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
                                  'Debes agregar la dosis de insulina',
                                ),
                              ],
                            ),
                          ),
                        );
                    } else {
                      final idao =
                          Provider.of<DiabetesDatabase>(context, listen: false)
                              .insulinDao;
                      idao.insertThis(InsulinsCompanion(
                        dosis: Value(int.parse(_dosisController.text)),
                        moment: Value(_moment),
                        date: Value(_date),
                      ));
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
