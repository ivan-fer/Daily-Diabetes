import 'package:daily_diabetes/constants.dart';
import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/widgets/nothing_to_see.dart';
import 'package:daily_diabetes/widgets/waiting_for_data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class WeightList extends StatefulWidget {
  @override
  _WeightListState createState() => _WeightListState();
}

class _WeightListState extends State<WeightList> {
  @override
  Widget build(BuildContext context) {
    final wdao = Provider.of<DiabetesDatabase>(context).weightDao;

    return Scaffold(
      appBar: appBarRegistry('Peso Lista'),
      body: StreamBuilder(
        stream: wdao.watchAll(),
        builder: (context, AsyncSnapshot<List<Weight>> snapshot) {
          final wei = snapshot.data ?? List();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return WaitingForData();
          }
          if (wei.isEmpty) {
            return NothingToSee();
          }
          return ListView.builder(
            itemCount: wei.length,
            itemBuilder: (_, index) {
              Weight itemWei = wei[index];
              return Card(
                margin: const EdgeInsets.fromLTRB(8, 5, 10, 1),
                child: ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${itemWei.weight}',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.teal,
                        ),
                      ),
                      Text(
                        ' kg',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                  title: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        MdiIcons.calendar,
                        size: 18,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      _buildDate(itemWei),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        MdiIcons.clockTimeFourOutline,
                        size: 18,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      _buildTime(itemWei),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildDate(Weight itemWei) {
    return Text(
      buildDate(itemWei.date),
      style: TextStyle(color: Colors.purple, fontSize: 22),
    );
  }

  Widget _buildTime(Weight itemWei) {
    return Text(
      buildTime(itemWei.date),
      style: TextStyle(color: Colors.purple, fontSize: 22),
    );
  }
}
