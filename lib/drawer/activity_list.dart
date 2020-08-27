import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/widgets/nothing_to_see.dart';
import 'package:daily_diabetes/widgets/waiting_for_data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ActivityList extends StatefulWidget {
  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  @override
  Widget build(BuildContext context) {
    final adao = Provider.of<DiabetesDatabase>(context).activityDao;

    return Scaffold(
      appBar: AppBar(
        title: Text('Actividades Lista'),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: adao.watchAll(),
        builder: (context, AsyncSnapshot<List<Activity>> snapshot) {
          final act = snapshot.data ?? List();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return WaitingForData();
          }
          if (act.isEmpty) {
            return NothingToSee();
          }
          return ListView.builder(
            itemCount: act.length,
            itemBuilder: (BuildContext context, int index) {
              Activity itemAct = act[index];
              return Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: primaryColor.withAlpha(90),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: _buildIcon(itemAct),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemAct.name,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(MdiIcons.calendar),
                            SizedBox(
                              width: 16,
                            ),
                            _buildDate(itemAct),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Icon(MdiIcons.clockIn),
                            SizedBox(
                              width: 16,
                            ),
                            _buildTime(itemAct.timeIni),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Icon(MdiIcons.clockOut),
                            SizedBox(
                              width: 16,
                            ),
                            _buildTime(itemAct.timeEnd),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(4, 4, 4, 8),
                          width: MediaQuery.of(context).size.width - 92,
                          child: Text(
                            itemAct.note,
                            softWrap: true,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildIcon(Activity itemAct) {
    switch (itemAct.type) {
      case 'Caminar':
        return Icon(
          MdiIcons.walk,
          size: 60,
          color: Colors.orange,
        );
      case 'Correr':
        return Icon(
          MdiIcons.run,
          size: 60,
          color: Colors.orange,
        );
      case 'Nadar':
        return Icon(
          MdiIcons.swim,
          size: 60,
          color: Colors.orange,
        );
    }
    return Icon(
      MdiIcons.headQuestionOutline,
      size: 60,
      color: Colors.red,
    );
  }

  Widget _buildDate(Activity itemAct) {
    var cad = '';
    if (itemAct.date.day < 10) {
      cad += '0';
    }
    cad +=
        '${itemAct.date.day}-${monthList[itemAct.date.month - 1]}-${itemAct.date.year}';
    return Text(
      cad,
      style: TextStyle(color: Colors.purple, fontSize: 22),
    );
  }

  Widget _buildTime(DateTime timeIni) {
    var cad = '';
    if (timeIni.hour < 10) {
      cad += '0';
    }
    cad += '${timeIni.hour}:';
    if (timeIni.minute < 10) {
      cad += '0';
    }
    cad += '${timeIni.minute}';
    return Text(
      cad,
      style: TextStyle(color: Colors.purple, fontSize: 22),
    );
  }
}
