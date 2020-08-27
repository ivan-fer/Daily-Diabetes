import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF4fc2f7);
const Color primaryLightColor = Color(0xFF97e6ff);
const Color primaryDarkColor = Color(0xFF1985c1);
const Color secondaryColor = Color(0xFFffe57f);
const Color secondaryLightColor = Color(0xFFffffb0);
const Color secondaryDarkColor = Color(0xFFcab350);
const Color primaryTextColor = Color(0xFF005662);
const Color secondaryTextColor = Color(0xFFFFFFFF);

const Color backgroundPageColor = Color(0xFFfafafa);
const Color backgroundPanelColor = Color(0xFFFFFFFF);

final BoxDecoration panelBoxDecoration = BoxDecoration(
  color: backgroundPanelColor,
  borderRadius: BorderRadius.all(
    Radius.circular(12),
  ),
  border: Border.all(
    color: primaryDarkColor.withAlpha(30),
    width: 1,
  ),
);

AppBar appBarRegistry(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: secondaryTextColor,
        fontSize: 24,
      ),
    ),
    elevation: 0,
    backgroundColor: primaryDarkColor,
  );
}


const List<String> activityList = [
  'Caminar',
  'Correr',
  'Nadar',
  'Bicicleta',
  'Gimnasia',
  'Aeróbica',
  'Otros',
];

const List<String> momentList = [
  'ántes del desayuno',
  'después del desayuno',
  'ántes de la colación',
  'después de la colación',
  'ántes del almuerzo',
  'después del almuerzo',
  'ántes de la merienda',
  'después de la merienda',
  'ántes de la cena',
  'después de la cena'
];

/// Los tres momentos del día donde recuperar datos
enum DayMoments { MANANA, TARDE, NOCHE }

const List<String> monthList = [
  'ene',
  'feb',
  'mar',
  'abr',
  'may',
  'jun',
  'jul',
  'ago',
  'set',
  'oct',
  'nov',
  'dic'
];

/// Periodos de fechas para filtrar las listas.
enum dateFilters {
  todos,
  ultimaSemana,
  ultimoMes,
  ultimoAnio,
  filtrar,
}

String buildDate(DateTime date) {
  // si fue hoy
  if (date.day == DateTime.now().day &&
      date.month == DateTime.now().month &&
      date.year == DateTime.now().year) {
    return 'Hoy';
  }
  // si fue ayer
  if (date.day == DateTime.now().day - 1 &&
      date.month == DateTime.now().month &&
      date.year == DateTime.now().year) {
    return 'Ayer';
  }
  var cad = '';
  if (date.day < 10) {
    cad += '0';
  }
  cad += '${date.day}-${monthList[date.month - 1]}-${date.year}';
  return cad;
}

String buildTime(DateTime date) {
  var cad = '';
  if (date.hour < 10) {
    cad += '0';
  }
  cad += '${date.hour}:';
  if (date.minute < 10) {
    cad += '0';
  }
  cad += '${date.minute}';
  return cad;
}
