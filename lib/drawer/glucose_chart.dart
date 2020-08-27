import 'package:charts_flutter/flutter.dart' as charts;
import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/views/glucose_time_chart.dart';
import 'package:daily_diabetes/widgets/nothing_to_see.dart';
import 'package:daily_diabetes/widgets/waiting_for_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class GlucoseChart extends StatefulWidget {
  @override
  _GlucoseChartState createState() => _GlucoseChartState();
}

class _GlucoseChartState extends State<GlucoseChart> {
  @override
  Widget build(BuildContext context) {
    final gdao = Provider.of<DiabetesDatabase>(context).glucoseDao;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Glucemia Gráficos',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: gdao.watchAll(true),
        builder: (BuildContext context, AsyncSnapshot<List<Glucose>> snapshot) {
          final gs = snapshot.data ?? List();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return WaitingForData();
          }
          if (gs.isEmpty) {
            return NothingToSee();
          }

          return Container(
            margin: EdgeInsets.fromLTRB(12, 20, 12, 12),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: primaryDarkColor.withAlpha(30),
                width: 1,
              ),
            ),
            child: _buildAllData(gs),
          );
        },
      ),
    );
  }

  Widget _buildAllData(List glucs) {
    List<TimeSeriesGlucose> data = new List();
    List<TimeSeriesGlucose> data2 = new List();
    List<TimeSeriesGlucose> data3 = new List();

    for (Glucose g in glucs) {
      if (g.moment == momentList[0] ||
          g.moment == momentList[1] ||
          g.moment == momentList[3] ||
          g.moment == momentList[4]) {
        data.add(new TimeSeriesGlucose(g.date, g.level));
      } else if (g.moment == momentList[5] || g.moment == momentList[6]) {
        data2.add(new TimeSeriesGlucose(g.date, g.level));
      } else if (g.moment == momentList[7] || g.moment == momentList[8]) {
        data3.add(new TimeSeriesGlucose(g.date, g.level));
      }
    }
    List<charts.Series<TimeSeriesGlucose, DateTime>> s = [
      new charts.Series<TimeSeriesGlucose, DateTime>(
        id: 'mañana',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesGlucose sales, _) => sales.date,
        measureFn: (TimeSeriesGlucose sales, _) => sales.level,
        data: data,
      ),
      new charts.Series<TimeSeriesGlucose, DateTime>(
        id: 'tarde',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (TimeSeriesGlucose sales, _) => sales.date,
        measureFn: (TimeSeriesGlucose sales, _) => sales.level,
        data: data2,
      ),
      new charts.Series<TimeSeriesGlucose, DateTime>(
        id: 'noche',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesGlucose sales, _) => sales.date,
        measureFn: (TimeSeriesGlucose sales, _) => sales.level,
        data: data3,
      ),
    ];

    return GlucoseTimeChart(
      seriesList: s,
      animate: true,
    );
  }
}
