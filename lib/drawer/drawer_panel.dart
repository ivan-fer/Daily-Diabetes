import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constants.dart';

class DrawerPanel extends StatefulWidget {
  @override
  _DrawerPanelState createState() => _DrawerPanelState();
}

class _DrawerPanelState extends State<DrawerPanel> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          _titleListDrawer(MdiIcons.formatListBulleted, ' Listas'),
          _itemListDrawer(MdiIcons.diabetes, 'Glucosa', 'listGlucose'),
          _itemListDrawer(MdiIcons.needle, 'Insulina', 'listInsulin'),
          _itemListDrawer(MdiIcons.weightKilogram, 'Peso', 'listWeight'),
          _itemListDrawer(MdiIcons.swim, 'Actividades', 'listActivity'),
          Divider(
            color: primaryColor,
          ),
          _titleListDrawer(MdiIcons.chartLine, ' Gráficos'),
          _itemListDrawer(MdiIcons.diabetes, 'Glucosa', 'chartGlucose'),
          Divider(
            color: primaryColor,
          ),
          _titleListDrawer(MdiIcons.expandAllOutline, ' Más'),
          _itemListDrawer(MdiIcons.file, 'Guardar a archivo', '/'),
        ],
      ),
    );
  }

  DrawerHeader _buildDrawerHeader() {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            ' Daily Diabetes',
            style: TextStyle(
              color: primaryTextColor,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            '       Un registro día a día\n       de la diabetes',
            style: TextStyle(
              color: primaryTextColor,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Menú',
            style: TextStyle(
              color: primaryTextColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: primaryLightColor,
      ),
    );
  }

  Row _titleListDrawer(IconData icon, String title) {
    return Row(
      children: [
        SizedBox(
          width: 8,
        ),
        Icon(
          icon,
          size: 30,
        ),
        Text(
          title,
          style: TextStyle(
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  ListTile _itemListDrawer(IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
