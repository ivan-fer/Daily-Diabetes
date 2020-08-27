import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GlucoseTimeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const GlucoseTimeChart({Key key, this.seriesList, this.animate})
      : super(key: key);

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory GlucoseTimeChart.withSampleData() {
    return new GlucoseTimeChart(
      seriesList: _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.LineRendererConfig(),
      customSeriesRenderers: [
        new charts.PointRendererConfig(
          customRendererId: 'customPoint',
        ),
      ],
      behaviors: [
        new charts.SeriesLegend(
          position: charts.BehaviorPosition.bottom,
        ),
      ],
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesGlucose, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesGlucose(new DateTime(2017, 9, 19), 5),
      new TimeSeriesGlucose(new DateTime(2017, 9, 26), 25),
      new TimeSeriesGlucose(new DateTime(2017, 10, 3), 100),
      new TimeSeriesGlucose(new DateTime(2017, 10, 10), 75),
    ];
    final data2 = [
      new TimeSeriesGlucose(new DateTime(2017, 9, 19), 15),
      new TimeSeriesGlucose(new DateTime(2017, 9, 26), 55),
      new TimeSeriesGlucose(new DateTime(2017, 10, 3), 90),
      new TimeSeriesGlucose(new DateTime(2017, 10, 10), 35),
    ];

    return [
      new charts.Series<TimeSeriesGlucose, DateTime>(
        id: 'en la mañana',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesGlucose sales, _) => sales.date,
        measureFn: (TimeSeriesGlucose sales, _) => sales.level,
        data: data,
      ),
      new charts.Series<TimeSeriesGlucose, DateTime>(
        id: 'en la tarde',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesGlucose sales, _) => sales.date,
        measureFn: (TimeSeriesGlucose sales, _) => sales.level,
        data: data2,
      )
    ];
  }
}

class TimeSeriesGlucose {
  final DateTime date;
  final int level;

  TimeSeriesGlucose(this.date, this.level);
}
