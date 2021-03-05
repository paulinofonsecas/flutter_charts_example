import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatelessWidget {
  final List<BarChartGroupData> data;
  MyChart(this.data);

  String getTiles(value) {
    switch (value.toInt()) {
      case 1:
        return 'S';
        break;
      case 2:
        return 'T';
        break;
      case 3:
        return 'Q';
        break;
      case 4:
        return 'Q';
        break;
      case 5:
        return 'S';
        break;
      case 6:
        return 'S';
        break;
      case 7:
        return 'D';
        break;
      default:
        return '~';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(
          border: Border.all(
            color: Colors.blue,
            style: BorderStyle.solid,
            width: 1,
          ),
          show: false,
        ),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (dataGroup, indexGroup, rad, indexRad) {
              return BarTooltipItem(
                'v: ${rad.y}',
                TextStyle(
                  color: Colors.black,
                ),
              );
            },
            tooltipBottomMargin: 10,
            tooltipBgColor: Colors.greenAccent,
            tooltipRoundedRadius: 30.0,
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(
            getTitles: getTiles,
            getTextStyles: (value) => TextStyle(
              color: Colors.white,
            ),
            showTitles: true,
          ),
        ),
        barGroups: data,
      ),
      swapAnimationDuration: Duration(milliseconds: 1000),
    );
  }
}
