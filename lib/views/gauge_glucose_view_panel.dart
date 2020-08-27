import 'package:daily_diabetes/data/database.dart';
import 'package:daily_diabetes/widgets/nothing_to_see.dart';
import 'package:daily_diabetes/widgets/waiting_for_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'gauge_glucose_painter.dart';

class GaugeGlucoseViewPanel extends StatefulWidget {
  @override
  _GaugeGlucoseViewPanelState createState() => _GaugeGlucoseViewPanelState();
}

class _GaugeGlucoseViewPanelState extends State<GaugeGlucoseViewPanel> {
  @override
  Widget build(BuildContext context) {
    final gdao = Provider.of<DiabetesDatabase>(context).glucoseDao;

    return StreamBuilder(
      stream: gdao.watchByDateSpan(
          DateTime.now().subtract(Duration(days: 7)), DateTime.now(), false),
      builder: (BuildContext context, AsyncSnapshot<List<Glucose>> snapshot) {
        final gs = snapshot.data ?? List();
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 4,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
//          height: 200,
          decoration: BoxDecoration(
            color: backgroundPanelColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(
              color: primaryDarkColor.withAlpha(30),
              width: 1,
            ),
          ),
          child: _buildCorpus(snapshot, gs),
        );
      },
    );
  }

  Widget _buildCorpus(AsyncSnapshot<List<Glucose>> snapshot, List gs) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return WaitingForData();
    }
    return _buildAllData(gs);
  }

  Column _buildAllData(List glucs) {
    // construir los datos
    int goodCases = 0;
    int upsCases = 0;
    int badCases = 0;
    int sumLevels = 0;
    for (Glucose g in glucs) {
      sumLevels += g.level;
      if (g.level >= 75 && g.level <= 120) {
        goodCases += 1;
      } else if (g.level < 75 || (g.level > 120 && g.level <= 180)) {
        upsCases += 1;
      } else if (g.level > 180) {
        badCases += 1;
      }
    }
    double levelPromedio = sumLevels / (goodCases + upsCases + badCases);

    return Column(
      children: [
        _buildHeader(),
        CustomPaint(
          painter: GaugeGlucosePainter(goodCases, upsCases, badCases),
          child: Container(
            height: 110,
          ),
        ),
        _buildPromedio(levelPromedio),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 180,
          child: Column(
            children: [
              _buildCasesCount('$goodCases', Colors.teal,
                  goodCases == 1 ? ' caso bueno' : ' casos buenos'),
              _buildCasesCount('$upsCases', Colors.orangeAccent,
                  upsCases == 1 ? ' caso de cuidado' : ' casos de cuidados'),
              _buildCasesCount('$badCases', Colors.red,
                  badCases == 1 ? ' caso malo' : ' casos malos'),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildCasesCount(String cant, Color colorBox, String descr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 10,
          height: 10,
          color: colorBox,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          cant,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 16,
          ),
        ),
        Text(descr),
      ],
    );
  }

  Row _buildPromedio(double prom) {
    print(prom);
    if (prom.isNaN) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No hay registros aún',
            style: TextStyle(color: primaryTextColor, fontSize: 18),
          ),
        ],
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'promedio:',
          style: TextStyle(color: primaryTextColor, fontSize: 18),
        ),
        Text(
          ' ${prom.toStringAsFixed(2)}',
          style: TextStyle(color: Colors.purple, fontSize: 20),
        ),
      ],
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Niveles de\nazúcar en sangre',
          style: TextStyle(
            color: primaryTextColor,
          ),
        ),
        Text(
          'últimos 7 días',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: primaryTextColor,
          ),
        ),
      ],
    );
  }
}
