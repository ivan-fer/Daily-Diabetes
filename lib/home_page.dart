import 'package:daily_diabetes/constants.dart';
import 'package:daily_diabetes/drawer/drawer_panel.dart';
import 'package:daily_diabetes/registry/registry_fab.dart';
import 'package:daily_diabetes/views/chart_glucose_view_panel.dart';
import 'package:daily_diabetes/views/gauge_glucose_view_panel.dart';
import 'package:daily_diabetes/views/last_insulin_view_panel.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: primaryColor,
      drawer: DrawerPanel(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [primaryColor, primaryDarkColor],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
                child: _buildHeader(),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: backgroundPageColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36),
                        ),
                      ),
                    ),
                    ListView(
                      children: [
                        GaugeGlucoseViewPanel(),
                        LastInsulinViewPanel(),
                        ChartGlucoseViewPanel(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: RegistryFab(),
    );
  }

  Stack _buildHeader() {
    return Stack(
      children: [
//        Positioned(
//          left: 222,
//          top: 3,
//          child: Icon(
//            Icons.invert_colors,
//            size: 80,
//            color: primaryTextColor.withAlpha(80),
//          ),
//        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                MdiIcons.menu,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              'Daily\n  Diabetes',
              style: TextStyle(
                fontFamily: 'WorkSans',
                fontSize: 36,
                letterSpacing: 4,
                color: primaryTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
