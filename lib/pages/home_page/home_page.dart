import 'package:flutter/material.dart';
import 'package:flutter_charts_example/componentes/bar_chart.dart';
import 'package:flutter_charts_example/controller/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Charts'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Card(
              color: Colors.blue,
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
                      child: Obx(() => MyChart(controller.data)),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            FlatButton(
              onPressed: controller.genereteNewsValues,
              child: Text('Gerar valores aleatorios'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
