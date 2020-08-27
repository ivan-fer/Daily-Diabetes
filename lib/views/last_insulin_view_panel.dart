import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/widgets/nothing_to_see.dart';
import 'package:daily_diabetes/widgets/waiting_for_data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class LastInsulinViewPanel extends StatefulWidget {
  @override
  _LastInsulinViewPanelState createState() => _LastInsulinViewPanelState();
}

class _LastInsulinViewPanelState extends State<LastInsulinViewPanel> {
  @override
  Widget build(BuildContext context) {
    final idao = Provider
        .of<DiabetesDatabase>(context)
        .insulinDao;

    return StreamBuilder(
      stream: idao.watchAll(),
      builder: (context, AsyncSnapshot<List<Insulin>> snapshot) {
        final ins = snapshot.data ?? List();
        if (snapshot.connectionState == ConnectionState.waiting) {
          return WaitingForData();
        }
        if (ins.isEmpty) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 4,
            ),
            decoration: panelBoxDecoration,
            child: ListTile(
              leading: _buildCircleAvatar(0),
              title: Text('última insulina'),
              subtitle: Text('Aún no hay registros de dosis'),
            ),
          );
        }
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 4,
          ),
          decoration: panelBoxDecoration,
          child: _buildAllData(ins[ins.length - 1]),
        );
      },
    );
  }

  ListTile _buildAllData(Insulin lins) {
    return ListTile(
      leading: _buildCircleAvatar(lins.dosis),
      title: Text('última insulina'),
      subtitle: Wrap(
        children: [
          Row(
            children: [
              Icon(
                MdiIcons.calendar,
                size: 18,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                buildDate(lins.date),
                style: TextStyle(color: Colors.purple, fontSize: 22),
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                MdiIcons.clockTimeFourOutline,
                size: 18,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                buildTime(lins.date),
                style: TextStyle(color: Colors.purple, fontSize: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CircleAvatar _buildCircleAvatar(int value) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: primaryTextColor.withAlpha(100),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white.withAlpha(210),
        child: Text(
          '$value',
          style: TextStyle(fontSize: 28, color: primaryTextColor),
        ),
      ),
    );
  }
}
