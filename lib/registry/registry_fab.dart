import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constants.dart';

class RegistryFab extends StatefulWidget {
  @override
  _RegistryFabState createState() => _RegistryFabState();
}

class _RegistryFabState extends State<RegistryFab> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      marginBottom: 24,
      marginRight: 24,
      overlayOpacity: .4,
//      overlayColor: primaryLightColor,
      animatedIcon: AnimatedIcons.add_event,
      animatedIconTheme: IconThemeData(size: 22.0),
      curve: Curves.bounceInOut,
      backgroundColor: primaryDarkColor,
      foregroundColor: secondaryTextColor,
      children: [
        _buildSpeedDialChild('Glucemia', MdiIcons.diabetes, 'regGlucose',
            'Glucemia agregada con éxito'),
        _buildSpeedDialChild(
            'Insulina', MdiIcons.needle, 'regInsulin', 'Insulina agregada con éxito'),
        _buildSpeedDialChild(
            'Peso', MdiIcons.weightKilogram, 'regWeight', 'Peso agregado con éxito'),
        _buildSpeedDialChild(
            'Actividades', MdiIcons.run, 'regActivity', 'Actividad agregada con éxito'),
      ],
    );
  }

  SpeedDialChild _buildSpeedDialChild(
      String label, IconData icon, String route, String snackBarText) {
    return SpeedDialChild(
      label: label,
      backgroundColor: primaryColor,
      child: Icon(
        icon,
        color: primaryTextColor,
      ),
      onTap: () async {
        final result = await Navigator.pushNamed(context, route);
        if (result != null && result) {
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(snackBarText),
              ),
            );
        }
      },
    );
  }
}
