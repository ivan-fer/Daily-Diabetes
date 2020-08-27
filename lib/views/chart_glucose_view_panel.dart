import 'package:charts_flutter/flutter.dart' as charts;
import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/widgets/nothing_to_see.dart';
import 'package:daily_diabetes/widgets/waiting_for_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'glucose_time_chart.dart';

class ChartGlucoseViewPanel extends StatefulWidget {
  @override
  _ChartGlucoseViewPanelState createState() => _ChartGlucoseViewPanelState();
}

class _ChartGlucoseViewPanelState extends State<ChartGlucoseViewPanel> {
  @override
  Widget build(BuildContext context) {
    final gdao = Provider.of<DiabetesDatabase>(context).glucoseDao;

    return StreamBuilder(
      stream: gdao.watchByDateSpan(
          DateTime.now().subtract(Duration(days: 30)), DateTime.now(), true),
      builder: (BuildContext context, AsyncSnapshot<List<Glucose>> snapshot) {
        final gs = snapshot.data ?? List();
        if (snapshot.connectionState == ConnectionState.waiting) {
          return WaitingForData();
        }
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 6,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          height: 260,
          decoration: panelBoxDecoration,
          child: Column(
            children: [
              Text('Glucosa, último mes'),
              Container(
                height: 220,
                child: _buildAllData(gs),
              ),
            ],
          ),
        );
      },
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
