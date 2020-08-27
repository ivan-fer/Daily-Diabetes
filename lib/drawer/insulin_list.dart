import 'package:daily_diabetes/constants.dart';
import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/widgets/nothing_to_see.dart';
import 'package:daily_diabetes/widgets/waiting_for_data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class InsulinList extends StatefulWidget {
  @override
  _InsulinListState createState() => _InsulinListState();
}

class _InsulinListState extends State<InsulinList> {
  @override
  Widget build(BuildContext context) {
    final idao = Provider.of<DiabetesDatabase>(context).insulinDao;

    return Scaffold(
      appBar: appBarRegistry('Insulina Lista'),
      body: StreamBuilder(
          stream: idao.watchAll(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Insulin>> snapshot) {
            final ins = snapshot.data ?? List();
            if (snapshot.connectionState == ConnectionState.waiting) {
              return WaitingForData();
            }
            if (ins.isEmpty) {
              return NothingToSee();
            }
            return ListView.builder(
                itemCount: ins.length,
                itemBuilder: (_, index) {
                  Insulin itemIns = ins[index];
                  return Card(
                    margin: const EdgeInsets.fromLTRB(8, 5, 10, 1),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Text(
                            '${itemIns.dosis}',
                            style: TextStyle(fontSize: 26),
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          Icon(
                            MdiIcons.calendar,
                            size: 18,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            buildDate(itemIns.date),
                            style:
                                TextStyle(color: Colors.purple, fontSize: 22),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            MdiIcons.clockTimeFourOutline,
                            size: 18,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            buildTime(itemIns.date),
                            style:
                                TextStyle(color: Colors.purple, fontSize: 22),
                          ),
                        ],
                      ),
                      subtitle: _buildMoment(itemIns),
                    ),
                  );
                });
          }),
    );
  }

  Widget _buildMoment(Insulin itemIns) {
    return Text(
      itemIns.moment,
      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
    );
  }
}
