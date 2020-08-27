import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/home_page.dart';
import 'package:daily_diabetes/registry/activity_registry_page.dart';
import 'package:daily_diabetes/registry/glucemia_registry_page.dart';
import 'package:daily_diabetes/registry/insulin_registry_page.dart';
import 'package:daily_diabetes/registry/weight_registry_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawer/activity_list.dart';
import 'drawer/glucose_chart.dart';
import 'drawer/glucose_list.dart';
import 'drawer/insulin_list.dart';
import 'drawer/weight_list.dart';

void main() {
  runApp(
    Provider<DiabetesDatabase>(
      create: (_) => DiabetesDatabase(),
      child: MyApp(),
      dispose: (_, db) => db.close(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Diabetes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'WorkSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        'regGlucose': (context) => GlucoseRegistryPage(),
        'regInsulin': (context) => InsulinRegistryPage(),
        'regWeight': (context) => WeightRegistryPage(),
        'regActivity': (context) => ActivityRegistryPage(),
        'listGlucose': (context) => GlucoseList(),
        'listInsulin': (context) => InsulinList(),
        'listWeight': (context) => WeightList(),
        'listActivity': (context) => ActivityList(),
        'chartGlucose': (context) => GlucoseChart(),
      },
    );
  }
}
