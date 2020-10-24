import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Top Vendas',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8),
                      child: MyChart(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyChart extends StatelessWidget {
  final defaultWidth = 10.0;

  List<BarChartGroupData> get data {
    return [
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            y: 5,
            colors: [Colors.purple, Colors.red],
            width: defaultWidth,
            borderRadius: BorderRadius.circular(90),
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            y: 4,
            colors: [Colors.purple, Colors.red],
            width: defaultWidth,
            borderRadius: BorderRadius.circular(90),
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            y: 9,
            colors: [Colors.purple],
            width: defaultWidth,
            borderRadius: BorderRadius.circular(90),
          ),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            y: 10,
            colors: [Colors.purple, Colors.red],
            width: defaultWidth,
            borderRadius: BorderRadius.circular(90),
          ),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
            y: 4,
            colors: [Colors.purple, Colors.red],
            width: defaultWidth,
            borderRadius: BorderRadius.circular(90),
          ),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
            y: 9,
            colors: [Colors.purple],
            width: defaultWidth,
            borderRadius: BorderRadius.circular(90),
          ),
        ],
      ),
      BarChartGroupData(
        x: 7,
        barRods: [
          BarChartRodData(
            y: 9,
            colors: [Colors.purple, Colors.red],
            width: defaultWidth,
            borderRadius: BorderRadius.circular(90),
          ),
        ],
      ),
    ];
  }

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
