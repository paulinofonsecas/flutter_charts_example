import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var _data = <BarChartGroupData>[].obs;

  List<BarChartGroupData> get data => _data.toList();

  @override
  void onInit() {
    genereteNewsValues();
    super.onInit();
  }

  genereteNewsValues() {
    List<double> dataMap = List.generate(
      7,
      (index) => Random.secure().nextInt(10).toDouble(),
    );
    final defaultWidth = 10.0;
    var index = 1;
    _data.assignAll(dataMap
        .map((e) => BarChartGroupData(
              x: index++,
              barRods: [
                BarChartRodData(
                  y: e,
                  colors: [Colors.purple, Colors.red],
                  width: defaultWidth,
                  borderRadius: BorderRadius.circular(90),
                ),
              ],
            ))
        .toList());
  }
}
