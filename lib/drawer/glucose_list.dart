import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/widgets/date_picker.dart';
import 'package:daily_diabetes/widgets/nothing_to_see.dart';
import 'package:daily_diabetes/widgets/waiting_for_data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class GlucoseList extends StatefulWidget {
  @override
  _GlucoseListState createState() => _GlucoseListState();
}

class _GlucoseListState extends State<GlucoseList> {
  var _selection = dateFilters.todos; // selección del menú
  bool _isAsc = false; // si la lista es de más antiguo a más nuevo
  bool _ok = false;
  DateTime _dmax;
  DateTime _dmin;
  DateTime _tempMin, _tempMax;

  @override
  Widget build(BuildContext context) {
    final gdao = Provider.of<DiabetesDatabase>(context).glucoseDao;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Glucemia Lista',
          style: TextStyle(
            color: secondaryTextColor,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        actions: [
          _buildIconButton(),
          PopupMenuButton<dateFilters>(
            offset: Offset(0, 13),
            onSelected: (dateFilters result) async {
              if (result == dateFilters.filtrar) {
                _ok = await _buildFilterDialog(context);
              }
              setState(() {
                _selection = result;
                if (_selection == dateFilters.ultimoAnio) {
                  _dmax = DateTime.now();
                  _dmin = DateTime.now().subtract(Duration(days: 365));
                } else if (_selection == dateFilters.ultimoMes) {
                  _dmax = DateTime.now();
                  _dmin = DateTime.now().subtract(Duration(days: 30));
                } else if (_selection == dateFilters.filtrar) {
                  if (_ok) {
                    _dmin = _tempMin;
                    _dmax = _tempMax;
                  }
                }
              });
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<dateFilters>>[
              _buildPopupMenuItem(dateFilters.todos, 'todos'),
              _buildPopupMenuItem(dateFilters.ultimoAnio, 'último año'),
              _buildPopupMenuItem(dateFilters.ultimoMes, 'último mes'),
              _buildPopupMenuItem(dateFilters.filtrar, 'filtrar...'),
            ],
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _buildWatchType(gdao),
        builder: (BuildContext context, AsyncSnapshot<List<Glucose>> snapshot) {
          final gs = snapshot.data ?? List();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return WaitingForData();
          }
          if (gs.isEmpty) {
            return NothingToSee();
          }
          // obtengo todas las fechas diferentes
          Set ds = new Set();
          for (Glucose g in gs) {
            var d = DateTime(g.date.year, g.date.month, g.date.day);
            ds.add(d);
          }
          return ListView.builder(
            itemCount: ds.length,
            itemBuilder: (_, index) {
              // obtengo todas las glicemias para un día dado
              List lg = new List();
              for (Glucose g in gs) {
                if (ds.elementAt(index) ==
                    DateTime(g.date.year, g.date.month, g.date.day)) {
                  lg.add(g);
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 16, 0, 4),
                    child: Text(
                      '${ds.elementAt(index).year}-${monthList[ds.elementAt(index).month - 1]}-${ds.elementAt(index).day}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple.shade300,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: lg.length,
                    itemBuilder: (_, index) {
                      Glucose itemGluc = lg[index];
                      return Card(
                        child: ExpansionTile(
                          childrenPadding: EdgeInsets.only(
                            left: 12,
                            bottom: 12,
                          ),
                          leading: _buildCircleAvatar(itemGluc),
                          title: _buildTime(itemGluc),
                          subtitle: _buildMoment(itemGluc),
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Nota: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(itemGluc.note == ''
                                ? '(sin nota)'
                                : itemGluc.note),
                          ],
                          trailing: Icon(
                            MdiIcons.chevronDown,
                            size: 35,
                          ),
                        ),
                      );
                    },
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Row _buildTime(Glucose itemGluc) {
    return Row(
      children: [
        Icon(
          MdiIcons.clockTimeFourOutline,
          size: 18,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          buildTime(itemGluc.date),
          style: TextStyle(color: Colors.purple, fontSize: 22),
        ),
      ],
    );
  }

  Stream<List<Glucose>> _buildWatchType(GlucoseDao gdao) {
    if (_selection == dateFilters.todos) {
      return gdao.watchAll(_isAsc);
    }
    return gdao.watchByDateSpan(_dmin, _dmax, _isAsc);
  }

  Future<bool> _buildFilterDialog(BuildContext context) async {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Filtrar por fechas: "),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('inicio:'),
                    DatePicker(
                      initialDate: DateTime.now().subtract(
                        Duration(days: 7),
                      ),
                      onDateSet: (date) {
                        _tempMin = date;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('fin:'),
                    DatePicker(
                      onDateSet: (date) {
                        _tempMax = date;
                      },
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              FlatButton(
                child: Text('cancelar'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('filtrar'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }

  PopupMenuItem<dateFilters> _buildPopupMenuItem(
      dateFilters filters, String label) {
    return PopupMenuItem<dateFilters>(
      value: filters,
      child: Row(
        children: [
          if (_selection == filters)
            Icon(
              MdiIcons.check,
              color: primaryTextColor,
            ),
          SizedBox(
            width: 8,
          ),
          Text(label),
        ],
      ),
    );
  }

  IconButton _buildIconButton() {
    return IconButton(
      icon: _isAsc == true
          ? Icon(Icons.arrow_upward)
          : Icon(Icons.arrow_downward),
      onPressed: () => setState(() => _isAsc = !_isAsc),
    );
  }

  Widget _buildMoment(Glucose itemGlic) {
    return Text(
      itemGlic.moment,
      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
    );
  }

  Widget _buildCircleAvatar(Glucose itemGluc) {
    int level = itemGluc.level;
    Color c = _getAvatarColor(level);
    return CircleAvatar(
      radius: 28,
      backgroundColor: c,
      child: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.white,
        foregroundColor: c,
        child: Text(
          '$level',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }

  Color _getAvatarColor(int level) {
    Color c = Colors.green;
    if (level < 70)
      c = Colors.redAccent;
    else if (level <= 80)
      c = Colors.orange;
    else if (level > 120 && level < 180)
      c = Colors.orange;
    else if (level >= 180) c = Colors.redAccent;
    return c;
  }
}
